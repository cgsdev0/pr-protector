extends Node

# NOTE (Sarah)
# So, you, continuity between levels of share price, if you fail a level,
# we should give you options to restart the level with an increase in share price,
# the option to NOT (Brian), and the option to restart the entire game.

onready var data = get_node("/root/Data").data
onready var Events = get_node("/root/Events")

var score
var prev_score

var tweakables

# various game state
var curr_time
var task_emails
var special_emails
var junk_emails
var task_windows
var reddit_tasks
var level_duration
var linear_complete

var level

var lost
var won
var completed

var mistakes
var successes

func _ready():
	tweakables = data.tweakables
	Events.connect("price_change", self, "on_price_change", [false])
	Events.connect("price_change_user", self, "on_price_change", [true])
	Events.connect("insert_email", self, "on_change_email_count", [1])
	Events.connect("email_link", self, "on_email_link")
	Events.connect("delete_daily_email", self, "on_read_special_email")
	Events.connect("delete_email", self, "on_change_email_count", [{}, -1])
	Events.connect("open_window", self, "on_change_window_count", [1])
	Events.connect("close_window", self, "on_change_window_count", [{}, -1])
	Events.connect("reddit_queue", self, "on_change_reddit_queue")
	Events.connect("reddit_upvote", self, "on_change_reddit_queue", [-1])
	Events.connect("reddit_downvote", self, "on_change_reddit_queue", [-1])
	Events.connect("new_level", self, "on_change_level")
	Events.connect("linear_level_completed", self, "on_linear_level_complete")
	Events.connect("reset_level", self, "on_reset_level")
	reset_state(true)

func on_reset_level(should_reset_score):
	if should_reset_score:
		reset_state(true)
	else:
		score = prev_score
		reset_state(false)
	
func on_read_special_email():
	special_emails = max(0, special_emails - 1)
	
func has_pending_tasks():
	return task_emails || task_windows || reddit_tasks || special_emails
	
func _process(delta):
	curr_time += delta
	
	# win condition
	if level && curr_time > level_duration \
			&& (linear_complete || !level.has("linear_sequencer")) \
			&& !has_pending_tasks() \
			&& !lost \
			&& !completed:
				
		completed = true
		yield(get_tree().create_timer(2.0), "timeout")
		if !lost:
			won = true
			print("YOU BEAT THE LEVEL")
			yield(get_tree().create_timer(3.0), "timeout")
			Events.emit_signal("win_level", level)
		
func on_linear_level_complete():
	linear_complete = true
	
func reset_state(reset_score: bool):
	lost = false
	won = false
	completed = false
	linear_complete = false
	curr_time = 0
	task_emails = 0
	special_emails = 0
	junk_emails = 0
	task_windows = 0
	reddit_tasks = 0
	successes = 0
	mistakes = 0
	level_duration = 60
	if reset_score:
		score = tweakables.starting_score
	prev_score = score

func max_sequencer(level):
	var m = 0
	if level.has("reddit_sequencer"):
		m = max(m, level.reddit_sequencer[-1])
	if level.has("email_sequencer"):
		m = max(m, level.email_sequencer[-1].time)
	return m

func on_delete_daily_email():
	self.started = true
	
func on_change_level(lev):
	reset_state(false)
	self.level_duration = max_sequencer(lev)
	self.level = lev
	
func on_change_reddit_queue(amount):
	reddit_tasks += amount
	print_game_state()
	
func on_price_change(amount, user):
	if won:
		return
	if user:
		if amount > 0:
			successes += 1
		else:
			mistakes += 1
	if score > 0:
		score = max(0.0, score + amount)
		
	if score == 0 && !lost:
		lost = true
		yield(get_tree().create_timer(3.0), "timeout")
		Events.emit_signal("lose_level")

func print_game_state():
	print ("========================")
	print ("JUNK EMAILS: ", junk_emails)
	print ("TASK EMAILS: ", task_emails)
	print ("SPECIAL EMAILS: ", special_emails)
	print ("TASK WINDOWS: ", task_windows)
	print ("REDDIT TASKS: ", reddit_tasks)
	
func on_email_link():
	task_emails -= 1
	junk_emails += 1
	
func on_change_email_count(email, count):
	if email.has("use_daily_viewer"):
		special_emails += count
	elif email.has("link"):
		task_emails += count
	else:
		junk_emails += count
	print_game_state()

func on_change_window_count(node, count):
	task_windows += count
	print_game_state()
	
# HELPER FUNCTION FOR COMPLETING A TASK
func complete_task(category: String, good: bool):
	var r = data.tweakables.rewards[category]["good" if good else "bad"]
	Events.emit_signal(
		"score_balloon", 
		r.base * tweakables.global_scalar, 
		r.range_lower * tweakables.global_scalar, 
		r.range_upper * tweakables.global_scalar
		)

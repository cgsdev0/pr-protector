extends Node

# NOTE (Sarah)
# So, you, continuity between levels of share price, if you fail a level,
# we should give you options to restart the level with an increase in share price,
# the option to NOT (Brian), and the option to restart the entire game.

onready var data = get_node("/root/Data").data
onready var Events = get_node("/root/Events")

var score

# various game state
var curr_time
var task_emails
var junk_emails
var task_windows
var reddit_tasks
var level_duration

var level_multiplier

var lost
var won
var completed

func _ready():
	Events.connect("price_change", self, "on_price_change")
	Events.connect("insert_email", self, "on_change_email_count", [1])
	Events.connect("email_link", self, "on_change_email_count", [{"link": true}, -1])
	Events.connect("delete_email", self, "on_change_email_count", [{}, -1])
	Events.connect("open_window", self, "on_change_window_count", [1])
	Events.connect("close_window", self, "on_change_window_count", [{}, -1])
	Events.connect("reddit_queue", self, "on_change_reddit_queue", [1])
	Events.connect("reddit_upvote", self, "on_change_reddit_queue", [-1])
	Events.connect("reddit_downvote", self, "on_change_reddit_queue", [-1])
	Events.connect("new_level", self, "on_change_level")
	reset_state(true)

func _process(delta):
	curr_time += delta
	if curr_time > level_duration && !task_emails && !task_windows && !reddit_tasks && !lost && !completed:
		completed = true
		yield(get_tree().create_timer(2.0), "timeout")
		if !lost:
			won = true
			print("YOU BEAT THE LEVEL")
			yield(get_tree().create_timer(5.0), "timeout")
			# TODO: show daily report
		
	
func reset_state(reset_score: bool):
	lost = false
	won = false
	completed = false
	curr_time = 0
	task_emails = 0
	junk_emails = 0
	task_windows = 0
	reddit_tasks = 0
	level_duration = 60
	level_multiplier = 1
	if reset_score:
		score = 30.0

func max_sequencer(level):
	var m = 0
	if level.has("reddit_sequencer"):
		m = max(m, level.reddit_sequencer[-1])
	if level.has("email_sequencer"):
		m = max(m, level.email_sequencer[-1].time)
	return m
	
func on_change_level(level):
	reset_state(false)
	level_multiplier = level.multiplier
	level_duration = max_sequencer(level)
	
func on_change_reddit_queue(amount):
	reddit_tasks += amount
	print_game_state()
	
func on_price_change(amount):
	if won:
		return
	if score > 0:
		score = max(0.0, score + amount)
	if score == 0 && !lost:
		lost = true
		yield(get_tree().create_timer(5), "timeout")
		# TODO: show loss screen

func print_game_state():
	print ("========================")
	print ("JUNK EMAILS: ", junk_emails)
	print ("TASK EMAILS: ", task_emails)
	print ("TASK WINDOWS: ", task_windows)
	print ("REDDIT TASKS: ", reddit_tasks)
	
func on_change_email_count(email, count):
	if email.has("link"):
		task_emails += count
	else:
		junk_emails += count
	print_game_state()

func on_change_window_count(node, count):
	task_windows += count
	print_game_state()
	
# HELPER FUNCTION FOR COMPLETING A TASK
func complete_task(category: String, good: bool):
	var r = data.rewards[category]["good" if good else "bad"]
	Events.emit_signal("score_balloon", r.base, r.range_lower, r.range_upper)

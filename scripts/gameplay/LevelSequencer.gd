extends Node


onready var data = get_node("/root/Data").data
onready var events = get_node("/root/Events")
onready var Score = get_node("/root/Score")

var level_index = 3 # TODO -1
var curr_time = 0
var level

var delaying_linear_task = false

func _ready():
	events.connect("next_level", self, "on_next_level")
	events.emit_signal("next_level")
	
func on_next_level():
	level_index += 1
	curr_time = 0
	level = null
	var transition = get_owner().find_node("DayTransition")
	
	print("NEW LEVEL", level_index)
	if level_index < len(data.levels):
		level = data.levels[level_index].duplicate()
		level.index = level_index
		get_owner().find_node("DamageTimer").wait_time = level.damage_rate
		transition.get_node("Title").text = "Day " + str(level_index + 1)
		transition.get_node("Title").get_node("Subtitle").text = level.title
		events.emit_signal("new_level", level)
	else:
		transition.get_node("Title").text = "The End"
		transition.get_node("Title").get_node("Subtitle").text = "Thanks for playing!"
	

func send_email(email_index):
	randomize()
	var email = data.emails[email_index].duplicate()
	if typeof(email.subject) == TYPE_ARRAY:
			email.subject.shuffle()
			email.subject = email.subject[0]
	if typeof(email.from) == TYPE_ARRAY:
			email.from.shuffle()
			email.from = email.from[0]
	if typeof(email.body) == TYPE_ARRAY:
			email.body.shuffle()
			email.body = email.body[0]
	events.emit_signal("insert_email", email)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !level:
		return

	curr_time += delta
	if level.has("linear_sequencer"):
		if Score.has_pending_tasks() || delaying_linear_task:
			return
		if len(level.linear_sequencer):
			var task = level.linear_sequencer.pop_front()
			delaying_linear_task = true
			yield(get_tree().create_timer(1.0), "timeout")
			
			if task.has("reddit"):
				events.emit_signal("reddit_queue", task.reddit)
			
			if task.has("email"):
				print("opening email ", task.email)
				assert(data.emails.has(task.email))
				send_email(task.email)
			
			# gross hack :(
			yield(get_tree().create_timer(0.1), "timeout")
			delaying_linear_task = false
		else:
			events.emit_signal("linear_level_completed")
		return
	
	# for non-linear levels
	if level.has("reddit_sequencer"):
		while len(level.reddit_sequencer) && level.reddit_sequencer[0] <= curr_time:
			level.reddit_sequencer.pop_front()
			events.emit_signal("reddit_queue", 1)
	if level.has("email_sequencer"):
		while len(level.email_sequencer) && level.email_sequencer[0].time <= curr_time:
			var email_index = level.email_sequencer.pop_front().email
			send_email(email_index)


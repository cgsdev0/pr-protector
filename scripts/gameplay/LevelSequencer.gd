extends Node


onready var data = get_node("/root/Data").data
onready var events = get_node("/root/Events")

var level_index = 0
var curr_time = 0
var level

func _ready():
	level = data.levels[level_index].duplicate()
	events.emit_signal("new_level", level)
	print(level)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	curr_time += delta
	if level.has("reddit_sequencer"):
		while len(level.reddit_sequencer) && level.reddit_sequencer[0] <= curr_time:
			level.reddit_sequencer.pop_front()
			events.emit_signal("reddit_queue")
	if level.has("email_sequencer"):
		while len(level.email_sequencer) && level.email_sequencer[0].time <= curr_time:
			var email_index = level.email_sequencer.pop_front().email
			events.emit_signal("insert_email", data.emails[email_index].duplicate())

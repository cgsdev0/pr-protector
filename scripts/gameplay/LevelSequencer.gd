extends Node


onready var data = get_node("/root/Data").data
onready var events = get_node("/root/Events")
onready var Score = get_node("/root/Score")

var level_index = 3 # -1 # TODO
var curr_time = 0
var level

func _ready():
	events.connect("next_level", self, "on_next_level")
	events.emit_signal("next_level")
	
func on_next_level():
	level_index += 1
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
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !level:
		return

	curr_time += delta
	if level.has("reddit_sequencer"):
		while len(level.reddit_sequencer) && level.reddit_sequencer[0] <= curr_time:
			level.reddit_sequencer.pop_front()
			events.emit_signal("reddit_queue")
	if level.has("email_sequencer"):
		while len(level.email_sequencer) && level.email_sequencer[0].time <= curr_time:
			var email_index = level.email_sequencer.pop_front().email
			events.emit_signal("insert_email", data.emails[email_index].duplicate())

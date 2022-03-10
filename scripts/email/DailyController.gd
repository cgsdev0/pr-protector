extends Control


onready var events = get_node("/root/Events")
onready var data = get_node("/root/Data").data

# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("delete_daily_email", self, "on_unpause")
	events.connect("new_level", self, "on_pause")



func on_pause(level):
	var email = data.emails[level.start_email]
	$CenterContainer/Node2D/From.text = email.from
	$CenterContainer/Node2D/Subject.text = email.subject
	$CenterContainer/Node2D/BodyContainer/Body.text = email.body
	get_tree().paused = true
	yield(get_tree().create_timer(2.5), "timeout")
	visible = true
	
func on_unpause():
	get_tree().paused = false
	visible = false

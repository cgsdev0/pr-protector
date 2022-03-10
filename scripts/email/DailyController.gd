extends Control


onready var events = get_node("/root/Events")

# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("delete_daily_email", self, "on_unpause")
	events.connect("show_daily_email", self, "on_pause")
	on_pause()

func on_pause():
	get_tree().paused = true
	visible = true
	
func on_unpause():
	get_tree().paused = false
	visible = false

extends Control


onready var events = get_node("/root/Events")

# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("unpause_game", self, "on_unpause")
	events.connect("pause_game", self, "on_pause")
	pass # Replace with function body.

func on_pause():
	get_tree().paused = true
	visible = true
	
func on_unpause():
	get_tree().paused = false
	visible = false

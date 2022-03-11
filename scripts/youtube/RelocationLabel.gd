extends Label

onready var events = get_node("/root/Events")

# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("select_state", self, "on_select")
	pass # Replace with function body.

func on_select(state):
	text = state

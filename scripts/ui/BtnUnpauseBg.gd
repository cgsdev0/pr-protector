extends Control


onready var events = get_node("/root/Events")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _gui_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == 1:
		events.emit_signal("unpause_game")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

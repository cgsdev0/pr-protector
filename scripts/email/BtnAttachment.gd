extends ColorRect

onready var events = get_node("/root/Events")


func _gui_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == 1:
		events.emit_signal("email_link")

extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal move_to_top

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			accept_event()
			emit_signal('move_to_top', self)

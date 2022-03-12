extends Control


func _gui_input(event):
	if event is InputEventMouseButton && event.button_index == 1 && event.pressed:
		visible = false

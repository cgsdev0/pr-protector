extends Button


func _gui_input(event):
	if event is InputEventMouseButton && event.pressed:
		get_parent().visible = false

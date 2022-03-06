extends Button


	
func _gui_input(event):
	if event is InputEventMouseButton && event.pressed && !disabled:
		disabled = true
		mouse_default_cursor_shape = Control.CURSOR_ARROW
		get_parent().find_node("Layer2").visible = true

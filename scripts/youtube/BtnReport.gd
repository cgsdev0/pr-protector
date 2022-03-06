extends Button


	
func _pressed():
		disabled = true
		mouse_default_cursor_shape = Control.CURSOR_ARROW
		get_parent().find_node("Layer2").visible = true

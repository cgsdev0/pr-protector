extends CheckBox


func _gui_input(event):
	if event is InputEventMouseButton && event.pressed && disabled:
		get_owner().find_node("Layer3").visible = true

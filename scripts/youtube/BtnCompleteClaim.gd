extends Button

onready var events = get_node("/root/Events")

func _pressed():
		disabled = true
		mouse_default_cursor_shape = Control.CURSOR_ARROW
		get_owner().find_node("Layer2").visible = false
		get_owner().find_node("Layer3").visible = false
		get_owner().find_node("Layer4").visible = false
		get_owner().find_node("Layer5").visible = false
		get_owner().find_node("Layer6").visible = true
		get_owner().setClosable(true)
		events.emit_signal("score_balloon", 5, -0.5, 0.9)

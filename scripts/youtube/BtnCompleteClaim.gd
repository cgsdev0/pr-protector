extends Button

onready var events = get_node("/root/Events")
onready var Score = get_node("/root/Score")

func _pressed():
		disabled = true
		mouse_default_cursor_shape = Control.CURSOR_ARROW
		get_owner().find_node("Layer2").visible = false
		get_owner().find_node("Layer3").visible = false
		get_owner().find_node("Layer4").visible = false
		get_owner().find_node("Layer5").visible = false
		get_owner().find_node("Layer6").visible = true
		get_owner().setClosable(true)
		Score.complete_task("youtube", true)

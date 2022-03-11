extends Button

onready var events = get_node("/root/Events")

func _ready():
	events.connect("beat_captcha", self, "on_enable")
	
func on_enable():
	disabled = false
	
func _pressed():
	disabled = true
	mouse_default_cursor_shape = Control.CURSOR_ARROW
	get_owner().find_node("Layer5").visible = true

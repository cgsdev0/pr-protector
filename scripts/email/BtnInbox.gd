extends Control


onready var events = get_node("/root/Events")

var email

func _ready():
	set_owner(get_parent().get_owner())
	if email:
		$Subject.text = email.subject
		$From.text = "From: " + email.from

func _gui_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == 1:
		events.emit_signal("open_email", get_index(), email)

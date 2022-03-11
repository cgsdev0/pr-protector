extends Control


onready var events = get_node("/root/Events")

var email

func _ready():
	set_owner(get_parent().get_owner())
	if email:
		$Content/Subject.text = email.subject
		$Content/From.text = "From: " + email.from
		if email.has("first"):
			$Content/AnimationPlayer.play("Flash")

func _gui_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == 1:
		events.emit_signal("open_email", get_index(), email)

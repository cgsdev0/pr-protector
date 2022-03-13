extends Control


onready var events = get_node("/root/Events")

var email
var link_used = false

func _ready():
	set_owner(get_parent().get_owner())
	if email:
		$Content/Subject.text = email.subject
		$Content/From.text = "From: " + email.from
		if email.has("first"):
			$Content/AnimationPlayer.play("Flash")

func _gui_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == 1:
		if email.has("use_daily_viewer") && email.use_daily_viewer:
			var synthetic_level = {
				"start_email": email.index,
			}
			events.emit_signal("open_email_as_daily", synthetic_level)
			queue_free()
		else:
			events.emit_signal("open_email", get_index(), email, link_used)

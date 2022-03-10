extends TextureButton

onready var events = get_node("/root/Events")

func _pressed():
	events.emit_signal("delete_daily_email")

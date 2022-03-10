extends TextureButton

onready var events = get_node("/root/Events")

func _pressed():
	events.emit_signal("reddit_upvote")

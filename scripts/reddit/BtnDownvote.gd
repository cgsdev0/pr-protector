extends TextureButton

signal reddit_downvote

func _pressed():
	emit_signal("reddit_downvote")

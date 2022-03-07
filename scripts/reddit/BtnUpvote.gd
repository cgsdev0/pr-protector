extends TextureButton

signal reddit_upvote

func _pressed():
	emit_signal("reddit_upvote")

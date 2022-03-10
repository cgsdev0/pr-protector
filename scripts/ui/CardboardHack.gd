extends Control


# i can't believe you've done this
func _ready():
	visible = true
	yield(get_tree().create_timer(2.5), "timeout")
	visible = false

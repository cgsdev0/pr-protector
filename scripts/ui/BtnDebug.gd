extends Button

onready var events = get_node("/root/Events")

func _pressed():
	events.emit_signal("unpause_game")
	get_tree().change_scene("res://debug.tscn")

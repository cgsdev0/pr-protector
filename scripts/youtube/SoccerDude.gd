extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var start
var travel = 50

func _ready():
	start = position

func _process(delta):
	var cached_position = position
	global_position.x = get_global_mouse_position().x
	position.x = min(max(position.x, start.x - travel), start.x + travel)
	var desired_position = position
	position = cached_position
	position = position.move_toward(desired_position, delta * 150)

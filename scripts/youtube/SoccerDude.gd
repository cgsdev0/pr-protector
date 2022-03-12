extends KinematicBody2D

onready var events = get_node("/root/Events")

var start
var travel = 50
var started = false

func _ready():
	events.connect("beat_captcha", self, "on_beat_captcha")
	start = position

func on_beat_captcha(id):
	if id != get_owner().get_instance_id():
		return
	started = false
	$Soccerdude1.play()
	
func _process(delta):
	if !started:
		return
	var cached_position = position
	global_position.x = get_global_mouse_position().x
	position.x = min(max(position.x, start.x - travel), start.x + travel)
	var desired_position = position
	position = cached_position
	position = position.move_toward(desired_position, delta * 150)


func _on_ColorRect_soccer_game_start():
	started = true

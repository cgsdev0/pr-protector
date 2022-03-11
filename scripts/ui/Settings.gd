extends Control


onready var events = get_node("/root/Events")

var was_paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("unpause_game", self, "on_unpause")
	events.connect("pause_game", self, "on_pause")
	pass # Replace with function body.

func on_pause(already_paused):
	was_paused = already_paused
	get_tree().paused = true
	visible = true
	# $AnimationPlayer.play("FadeIn")
	
func on_unpause():
	if !was_paused:
		get_tree().paused = false
	was_paused = false
	# $AnimationPlayer.play_backwards("FadeIn")
	# yield(get_tree().create_timer(1.0), "timeout")
	visible = false

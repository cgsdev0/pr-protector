extends Node2D


onready var events = get_node("/root/Events")
onready var Score = get_node("/root/Score")
onready var balloonScript = preload("res://scripts/ui/ScoreBalloon.gd")


var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("score_balloon", self, "on_score_balloon")
	events.connect("damage_tick", self, "on_damage_tick")
	rng.randomize()

func rand_round(a, b):
	return floor(rng.randf_range(-0.3, 0.3) * 100) / 100.0

func on_damage_tick():
	var level_multiplier = 2 # TODO
	var task_count = Score.task_emails + (Score.junk_emails * 0.25) + Score.task_windows
	var task_multiplier = 1 + (task_count / 5.0)
	events.emit_signal("price_change", (-0.7 + rand_round(-0.25, 0.17)) * task_multiplier * level_multiplier)
	
func on_score_balloon(change, btm, top):
	var node = Node2D.new()
	node.set_script(balloonScript)
	node.position = get_global_mouse_position()
	node.jitter = Vector2(rng.randf_range(-100, 100), rng.randf_range(0, 40))
	node.change = change + rand_round(btm, top)
	add_child(node)

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
	var rescale = 1
	var should_rescale = Score.level.has("rescale_damage") && Score.level.rescale_damage
	if should_rescale:
		rescale = max(1, 3 * (Score.score - Score.tweakables.starting_score) / Score.tweakables.starting_score)
		# print(rescale)
	var rng_damge = (-1.0 + rand_round(-0.11, 0.08)) * Score.tweakables.global_scalar * rescale
	
	var correcting = Score.level.has("self_correct_price") && Score.level.self_correct_price
	var losses = Score.tweakables.starting_score - Score.score
	if losses > 0 && correcting:
		events.emit_signal("price_change", max(losses / 2, min(losses, -rng_damge)))
		return
		
	var level_multiplier = Score.level.multiplier
	var task_count = Score.task_emails \
						+ (Score.junk_emails * 0.25) \
						+ Score.task_windows \
						+ Score.reddit_tasks * 0.17
	var task_multiplier = 1 + (task_count / 5.0)
	# print("MULT: ", task_multiplier * level_multiplier)
	events.emit_signal("price_change", (rng_damge) * task_multiplier * level_multiplier)
	
func on_score_balloon(change, btm, top):
	var node = Node2D.new()
	node.set_script(balloonScript)
	node.position = get_global_mouse_position()
	node.jitter = Vector2(rng.randf_range(-100, 100), rng.randf_range(0, 40))
	node.change = change + rand_round(btm, top)
	add_child(node)

extends Node2D


onready var events = get_node("/root/Events")
onready var balloonScript = preload("res://scripts/ui/ScoreBalloon.gd")


var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("score_balloon", self, "on_score_balloon")
	rng.randomize()
	pass # Replace with function body.

func on_score_balloon(change):
	var node = Node2D.new()
	node.set_script(balloonScript)
	node.position = get_global_mouse_position()
	node.jitter = Vector2(rng.randf_range(-100, 100), rng.randf_range(0, 40))
	node.change = change
	add_child(node)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

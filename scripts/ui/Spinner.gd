extends Node2D


var triggered = false

var rng = RandomNumberGenerator.new()

export var min_delay : float = 4.0
export var max_delay : float = 8.0

func _ready():
	rng.randomize()

func _process(delta):
	if triggered || !self.is_visible_in_tree():
		return
	triggered = true
	yield(get_tree().create_timer(rng.randf_range(min_delay, max_delay)), "timeout")
	for child in get_parent().get_children():
		child.visible = true
	visible = false

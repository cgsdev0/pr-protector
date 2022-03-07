extends AnimatedSprite

var rng = RandomNumberGenerator.new()

func pause_play():
	playing = !playing
	if playing:
		yield(get_tree().create_timer(rng.randf_range(2.0, 6.0)), "timeout")
	else:
		yield(get_tree().create_timer(rng.randf_range(0.1, 1.2)), "timeout")
	pause_play()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	pause_play()

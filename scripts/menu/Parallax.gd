extends ParallaxBackground

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	scroll_offset.x -= delta * 30

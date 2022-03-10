extends TextureButton


onready var events = get_node("/root/Events")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _pressed():
	events.emit_signal("pause_game")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

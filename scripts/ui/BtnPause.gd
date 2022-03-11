extends TextureButton


onready var events = get_node("/root/Events")

var i_paused = false
# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("unpause_game", self, "on_unpause")
	pass # Replace with function body.

func on_unpause():
	i_paused = false
	
func _pressed():
	if get_tree().paused && i_paused:
		i_paused = false
		events.emit_signal("unpause_game")
	else:
		i_paused = true
		events.emit_signal("pause_game", get_tree().paused)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

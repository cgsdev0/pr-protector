extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var events = get_node("/root/Events")

var my_color
var disabled = false

# Called when the node enters the scene tree for the first time.
func _ready():
	my_color = color
	connect('mouse_entered', self, '_on_mouse_entered')
	connect('mouse_exited', self, '_on_mouse_exited')

func _on_mouse_entered():
	if disabled:
		return
	color = Color("#333b4f")

func _on_mouse_exited():
	color = my_color

func _gui_input(event):
	if disabled:
		return
	if event is InputEventMouseButton && event.pressed && event.button_index == 1:
		events.emit_signal("tweet_clicked", get_index(), get_owner().get_instance_id())

extends TextureButton

onready var events = get_node("/root/Events")

func _ready():
	Events.connect("photoshop_enable_delete", self, "on_enable")

func on_enable():
	disabled = false

func _pressed():
	events.emit_signal("photoshop_delete")
	disabled = true

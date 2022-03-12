extends TextureButton

onready var events = get_node("/root/Events")

func _ready():
	Events.connect("photoshop_enable_paste", self, "on_enable")

func on_enable(id):
	if id != get_owner().get_instance_id():
		return
	disabled = false

func _pressed():
	events.emit_signal("photoshop_paste", get_owner().get_instance_id())
	disabled = true

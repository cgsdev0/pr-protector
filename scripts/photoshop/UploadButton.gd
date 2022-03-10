extends TextureButton

onready var events = get_node("/root/Events")

func _ready():
	Events.connect("photoshop_enable_upload", self, "on_enable")

func on_enable():
	disabled = false

func _pressed():
	get_owner().photoshop_freeze = true
	events.emit_signal("photoshop_freeze")
	events.emit_signal("photoshop_upload")
	get_parent().visible = false

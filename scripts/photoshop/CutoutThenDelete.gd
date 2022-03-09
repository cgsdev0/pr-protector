extends "Cutout.gd"

onready var events = get_node("/root/Events")
	
var was_done = false

func _process(_delta):
	if !was_done && is_cutout_complete():
		was_done = true
		events.emit_signal("photoshop_enable_delete")

func _ready():
	Events.connect("photoshop_delete", self, "on_delete")
	
func on_delete():
	get_owner().photoshop_freeze = true
	get_parent().visible = false
	events.emit_signal("photoshop_enable_upload")

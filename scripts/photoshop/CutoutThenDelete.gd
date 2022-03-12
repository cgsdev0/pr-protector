extends "Cutout.gd"
	
var was_done = false

func _process(_delta):
	if !was_done && is_cutout_complete():
		was_done = true
		events.emit_signal("photoshop_enable_delete", get_owner().get_instance_id())

func _ready():
	Events.connect("photoshop_delete", self, "on_delete")
	challenge_success = true
	
func on_delete(id):
	if id != get_owner().get_instance_id():
		return
	get_owner().photoshop_freeze = true
	get_parent().visible = false
	events.emit_signal("photoshop_enable_upload", get_owner().get_instance_id())

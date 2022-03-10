extends Timer


onready var events = get_node("/root/Events")


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("timeout",self,"_on_timer_timeout") 
	pass # Replace with function body.

func _on_timer_timeout():
	events.emit_signal("damage_tick")

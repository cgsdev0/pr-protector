extends Control


onready var events = get_node("/root/Events")
onready var Score = get_node("/root/Score")
onready var data = get_node("/root/Data").data

# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("next_level", self, "on_play")
	events.connect("reset_level", self, "on_play2")

func on_play2(_should_reset_score):
	on_play()
	
func on_play():
	self.modulate = Color.transparent
	$AnimationPlayer.play("Fade")
	visible = true
	yield(get_tree().create_timer(5.0), "timeout")
	visible = false

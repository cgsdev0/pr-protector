extends Control


onready var events = get_node("/root/Events")
onready var Score = get_node("/root/Score")
onready var data = get_node("/root/Data").data

# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("lose_level", self, "on_lose")

func on_lose():
	self.modulate = Color.transparent
	$Buttons.modulate = Color.transparent
	$Subtitle.modulate = Color.transparent
	$AnimationPlayer.play("Fade")
	visible = true
	yield(get_tree().create_timer(2.3), "timeout")
	$Buttons.visible = true

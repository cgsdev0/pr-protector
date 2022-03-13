extends Node

onready var events = get_node("/root/Events")

func _ready():
	events.connect("insert_email", self, "on_get_email")
	events.connect("score_balloon", self, "on_score_balloon")
	events.connect("witness_captcha_wrong", self, "on_error_sound")
	events.connect("beat_captcha", self, "on_good_thing_long")
	
func on_good_thing_long(_id):
	$GoodThingLong.play()
	
func on_error_sound():
	$ErrorSound.play()
	
func on_score_balloon(amount, btm, top):
	if amount < 0:
		$BadThing.play()
	elif amount > 0:
		$GoodThing.play()
	
func on_get_email(_email):
	$EmailDing.play()
	
var potential_click = false

func _unhandled_input(event):
	potential_click = false
	
func _process(_delta):
	if potential_click:
		potential_click = false
		$ClickNoise.play()
		
func _input(event):
	if event is InputEventMouseButton && event.is_pressed() && event.button_index == 1:
		potential_click = true

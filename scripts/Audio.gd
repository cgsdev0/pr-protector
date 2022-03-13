extends Node

onready var events = get_node("/root/Events")

func _ready():
	events.connect("insert_email", self, "on_get_email")
	events.connect("score_balloon", self, "on_score_balloon")
	events.connect("witness_captcha_wrong", self, "on_error_sound")
	events.connect("beat_captcha", self, "on_good_thing_long")
	events.connect("next_level", self, "on_play_morning_track", [true])
	events.connect("reset_level", self, "on_play_morning_track")
	events.connect("delete_daily_email", self, "on_delete_daily_email")
	events.connect("open_email_as_daily", self, "on_open_as_daily")
	events.connect("unpause_game", self, "on_unpause_game")
	events.connect("pause_game", self, "on_pause_game")

var was_paused = false
func on_pause_game(already_paused):
	if !already_paused:
		$MorningTrack.play()
	else:
		was_paused = true

func on_open_as_daily(_level):
	$MorningTrack.play()
	
func on_unpause_game():
	if !was_paused:
		$MorningTrack.stop()
	was_paused = false
	
func on_delete_daily_email():
	$MorningTrack.stop()
	
func on_play_morning_track(_should_reset_score):
	
	$MorningTrack.play()

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

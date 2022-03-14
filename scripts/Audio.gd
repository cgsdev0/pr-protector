extends Node

onready var events = get_node("/root/Events")
onready var Score = get_node("/root/Score")
onready var data = get_node("/root/Data").data

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
	events.connect("win_level", self, "on_win_level")

var was_paused = false
var intended_track = "morning"

var frantic = false

func on_win_level(_level):
	stop_all()
	intended_track = "victory"
	$VictoryLap.play()
	
func on_pause_game(already_paused):
	if !already_paused || !$MorningTrack.playing:
		stop_all()
		$MorningTrack.play()
	else:
		was_paused = true

func on_open_as_daily(_level):
	stop_all()
	$MorningTrack.play()
	
func on_unpause_game():
	if !was_paused:
		stop_all()
		if intended_track == "daily":
			$DailyGrind.play()
		elif intended_track == "victory":
			$VictoryLap.play()
	was_paused = false
	
func on_delete_daily_email():
	stop_all()
	intended_track = "daily"
	$DailyGrindIntro.play()

func stop_all():
	$MorningTrack.stop()
	$DailyGrindIntro.stop()
	$VictoryLap.stop()
	$DailyGrind.stop()
	
func on_play_morning_track(_should_reset_score):
	stop_all()
	$MorningTrack.play()
	intended_track = "morning"

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

func float_mod(a, b):
	while a > b:
		a -= b
	return a
		
func _process(_delta):
	#if intended_track == "daily" && ! $MorningTrack.playing && !$DailyGrindIntro.playing && !$DailyGrind.playing:
	#	$DailyGrind.play()
	if !frantic && Score.score <= data.tweakables.starting_score * 0.45 && ($DailyGrind.playing || (!$DailyGrind.playing && !$DailyGrindIntro.playing)):
		frantic = true
		var seg = 43.308 / 6
		var into = float_mod($DailyGrind.get_playback_position(), seg)
		var sync_delay = seg - into
		if sync_delay > 0.05:
			yield(get_tree().create_timer(sync_delay), "timeout")
		$DailyGrindIntro.pitch_scale = 1.25
		$DailyGrind.pitch_scale = 1.25
	if frantic && Score.score >= data.tweakables.starting_score * 0.55  && ($DailyGrind.playing || (!$DailyGrind.playing && !$DailyGrindIntro.playing)):
		frantic = false
		var seg = 43.308 / 6
		var into = float_mod($DailyGrind.get_playback_position(), seg)
		var sync_delay = seg - into
		if sync_delay > 0.05:
			yield(get_tree().create_timer(sync_delay / 1.25), "timeout")
		$DailyGrindIntro.pitch_scale = 1.0
		$DailyGrind.pitch_scale = 1.0
		
	if potential_click:
		potential_click = false
		$ClickNoise.play()
		
func _input(event):
	if event is InputEventMouseButton && event.is_pressed() && event.button_index == 1:
		potential_click = true


func _on_DailyGrindIntro_finished():
	if intended_track == "daily" && !$MorningTrack.playing:
		$DailyGrind.play()

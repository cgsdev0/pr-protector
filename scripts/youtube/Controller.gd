extends Control

onready var PromptGenerator = get_node("/root/PromptGenerator")

var pitch_array = [
	1.0,
	1.5,
	2.0,
	0.75,
]
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	if !get_owner().youtube_title:
		var prompt = PromptGenerator.next_prompt(PromptGenerator.PROMPT_YOUTUBE)
		$Layer1/VideoTitle.text = prompt.text
	else:
		$Layer1/VideoTitle.text = get_owner().youtube_title
		
	if !get_owner().youtube_username:
		$Layer1/Username.text = PromptGenerator.get_rand_data(PromptGenerator.RAND_USERNAME)
	else:
		$Layer1/Username.text = get_owner().youtube_username
	
	var yt_index = rng.randi_range(0, 2)
	if get_owner().youtube_tuber_index:
		yt_index = get_owner().youtube_tuber_index
		
	$Layer1/Youtubers.get_child(yt_index).visible = true
	$Layer1/YoutuberVoice.pitch_scale = pitch_array[yt_index]
	
	if !get_owner().youtube_captcha:
		randomize()
		var opts = find_node("Captchas").get_children()
		opts.shuffle()
		opts[0].visible = true
	else:
		find_node("Captchas").get_node(get_owner().youtube_captcha).visible = true

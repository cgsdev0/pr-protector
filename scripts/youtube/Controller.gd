extends Control

onready var PromptGenerator = get_node("/root/PromptGenerator")

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
	
	if !get_owner().youtube_tuber_index:
		$Layer1/Youtubers.get_child(rng.randi_range(0, 2)).visible = true
	else:
		$Layer1/Youtubers.get_child(get_owner().youtube_tuber_index).visible = true
	
	if !get_owner().youtube_captcha:
		randomize()
		var opts = find_node("Captchas").get_children()
		opts.shuffle()
		opts[0].visible = true
	else:
		find_node("Captchas").get_node(get_owner().youtube_captcha).visible = true

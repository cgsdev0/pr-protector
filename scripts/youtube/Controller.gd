extends Control

onready var PromptGenerator = get_node("/root/PromptGenerator")

# Called when the node enters the scene tree for the first time.
func _ready():
	var prompt = PromptGenerator.next_prompt(PromptGenerator.PROMPT_YOUTUBE)
	$Layer1/VideoTitle.text = prompt.text
	$Layer1/Username.text = PromptGenerator.get_rand_data(PromptGenerator.RAND_USERNAME)

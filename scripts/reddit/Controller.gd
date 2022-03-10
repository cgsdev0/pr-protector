extends Control

onready var events = get_node("/root/Events")
onready var Score = get_node("/root/Score")
onready var PromptGenerator = get_node("/root/PromptGenerator")

var post
var queued = 0

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("reddit_upvote", self, "vote", [true])
	events.connect("reddit_downvote", self, "vote", [false])
	events.connect("reddit_queue", self, "on_queue")
	rng.randomize()
	
	post = update_with(new_post())

func on_queue():
	queued += 1
	if !post && queued:
		post = update_with(new_post())

func vote(up: bool):
	Score.complete_task("reddit", up == post.isgood)
	post = update_with(new_post())

func update_with(p):
	if !p:
		$PostBody.visible = false
		$LabelNoNewPosts.visible = true
		return p
	
	$PostBody.visible = true
	$LabelNoNewPosts.visible = false
	$PostBody/Title.text = p.text
	$PostBody/MarginContainer/Image.frame = p.image_index
	$PostBody/PostedBy.bbcode_text = "submitted " + p.when + " ago by [color=#4d7dd0]" + p.who + "[/color]"
	$PostBody/BottomDetails.text = str(p.comments) + " comments  share  save  hide"
	$PostBody/Score.text = str(p.score)
	return p
	
func new_post():
	if !queued:
		return null

	queued -= 1
	
	# generate post content
	var p = PromptGenerator.next_prompt(PromptGenerator.PROMPT_REDDIT)
	p.when = str(rng.randi_range(5, 40)) + " minutes ago"
	p.who = PromptGenerator.get_rand_data(PromptGenerator.RAND_USERNAME)
	p.score = rng.randi_range(0, 200)
	p.comments = rng.randi_range(0, 20)
	
	return p

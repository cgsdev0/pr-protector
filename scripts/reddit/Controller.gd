extends Control

onready var Events = get_node("/root/Events")
onready var PromptGenerator = get_node("/root/PromptGenerator")

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()

	var post = new_post()
	update_to_post(post)


func vote(up: bool):

	var post = new_post()
	update_to_post(post)
	
	Events.emit_signal("price_change", 1 if up else -1)

func update_to_post(post):
	$PostBody/Title.text = post.text
	$PostBody/PostedBy.bbcode_text = "submitted " + post.when + " ago by [color=#4d7dd0]" + post.who + "[/color]"
	$PostBody/BottomDetails.text = str(post.comments) + " comments  share  save  hide"
	$PostBody/Score.text = str(post.score)
	
func new_post():
	var post = PromptGenerator.next_prompt(PromptGenerator.PROMPT_REDDIT)
	post.when = str(rng.randi_range(5, 40)) + " minutes ago"
	post.who = PromptGenerator.get_rand_data(PromptGenerator.RAND_USERNAME)
	post.score = rng.randi_range(0, 200)
	post.comments = rng.randi_range(0, 20)
	return post

func _on_BtnUpvote_reddit_upvote():
	vote(true)

func _on_BtnDownvote_reddit_downvote():
	vote(false)

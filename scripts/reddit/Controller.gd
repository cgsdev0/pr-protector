extends Control

onready var events = get_node("/root/Events")
onready var PromptGenerator = get_node("/root/PromptGenerator")

var post

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	post = new_post()
	update_to_post(post)


func vote(up: bool):
	if up == post.isgood:
		events.emit_signal("score_balloon", 1.5, -0.1, 0.1)
	else:
		events.emit_signal("score_balloon", -4.5, -0.6, 0.6)

	post = new_post()
	update_to_post(post)
	
	# Events.emit_signal("price_change", 1 if up else -1)

func update_to_post(p):
	$PostBody/Title.text = p.text
	$PostBody/PostedBy.bbcode_text = "submitted " + p.when + " ago by [color=#4d7dd0]" + p.who + "[/color]"
	$PostBody/BottomDetails.text = str(p.comments) + " comments  share  save  hide"
	$PostBody/Score.text = str(p.score)
	
func new_post():
	var p = PromptGenerator.next_prompt(PromptGenerator.PROMPT_REDDIT)
	p.when = str(rng.randi_range(5, 40)) + " minutes ago"
	p.who = PromptGenerator.get_rand_data(PromptGenerator.RAND_USERNAME)
	p.score = rng.randi_range(0, 200)
	p.comments = rng.randi_range(0, 20)
	return p

func _on_BtnUpvote_reddit_upvote():
	vote(true)

func _on_BtnDownvote_reddit_downvote():
	vote(false)

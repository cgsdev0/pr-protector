extends Control

onready var Events = get_node("/root/Events")
onready var PromptGenerator = get_node("/root/PromptGenerator")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var postBody
var noNew

# Called when the node enters the scene tree for the first time.
func _ready():
	postBody = find_node("PostBody")
	noNew = find_node("LabelNoNewPosts")
	$PostBody/Title.text = new_post().text

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func vote(up: bool):
	# postBody.visible = false
	# noNew.visible = true
	var post = new_post()
	$PostBody/Title.text = post.text
	$PostBody/PostedBy.bbcode_text = "submitted " + post.when + " ago by [color=#4d7dd0]" + post.who + "[/color]"
	$PostBody/BottomDetails.text = str(post.comments) + " comments  share  save  hide"
	$PostBody/Score.text = str(post.score)
	Events.emit_signal("price_change", 1 if up else -1)

func new_post():
	var post = PromptGenerator.next_prompt(PromptGenerator.PROMPT_REDDIT)
	post.when = "6 hours ago"
	post.who = "badcop_"
	post.score = 50
	post.comments = 42
	return post

func _on_BtnUpvote_reddit_upvote():
	vote(true)

func _on_BtnDownvote_reddit_downvote():
	vote(false)

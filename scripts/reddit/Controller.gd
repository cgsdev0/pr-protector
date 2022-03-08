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
	$PostBody/Title.text = new_post().text
	Events.emit_signal("price_change", 1 if up else -1)

func new_post():
	return PromptGenerator.next_prompt(PromptGenerator.PROMPT_REDDIT)

func _on_BtnUpvote_reddit_upvote():
	vote(true)

func _on_BtnDownvote_reddit_downvote():
	vote(false)

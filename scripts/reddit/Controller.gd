extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var postBody
var noNew

# Called when the node enters the scene tree for the first time.
func _ready():
	postBody = find_node("PostBody")
	noNew = find_node("LabelNoNewPosts")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func vote(up: bool):
	postBody.visible = false
	noNew.visible = true
	

func _on_BtnUpvote_reddit_upvote():
	vote(true)


func _on_BtnDownvote_reddit_downvote():
	vote(false)

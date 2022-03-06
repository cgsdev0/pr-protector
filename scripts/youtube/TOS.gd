extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var checkbox
# Called when the node enters the scene tree for the first time.
func _ready():
	checkbox = get_parent().find_node("CheckBox")
	
func _process(_delta):
	# this is hardcoded idk how else to do it i'm sorry
	if get_v_scroll().ratio > 0.86:
		checkbox.disabled = false
		

extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var checkbox
# Called when the node enters the scene tree for the first time.
func _ready():
	checkbox = get_parent().find_node("CheckBox")
	
func _process(_delta):
	if get_v_scroll().max_value - get_v_scroll().value == margin_bottom - margin_top:
		checkbox.disabled = false
		

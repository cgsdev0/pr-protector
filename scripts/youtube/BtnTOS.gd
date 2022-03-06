extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var checkbox
# Called when the node enters the scene tree for the first time.
func _ready():
	checkbox = get_parent().find_node("CheckBox")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	disabled = !checkbox.pressed
	
func _gui_input(event):
	if event is InputEventMouseButton && event.pressed && !disabled:
		disabled = true
		mouse_default_cursor_shape = Control.CURSOR_ARROW
		get_owner().find_node("Layer4").visible = true

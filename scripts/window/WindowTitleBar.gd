extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Pickable needs to be selected from the inspector



var can_grab = false
var grabbed_offset = Vector2()

func _gui_input(event):
	if event is InputEventMouseButton && event.button_index == 1:
		can_grab = event.pressed
		grabbed_offset = get_owner().position - get_global_mouse_position()

var bounds = Vector2(640, 480)
var taskbar_height = 0

func _ready():
	var win_control = get_owner().get_parent()
	if win_control and !(win_control is Viewport):
		bounds = win_control.rect_size
	
		var taskbar = win_control.get_parent().find_node("Taskbar")
		if taskbar:
			taskbar_height = taskbar.rect_size.y + 1
		
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		get_owner().position = get_global_mouse_position() + grabbed_offset
		get_owner().position.x = round(get_owner().position.x)
		get_owner().position.y = round(get_owner().position.y)
		if (get_owner().position.x < 1):
			get_owner().position.x = 1
		if (get_owner().position.y < 0):
			get_owner().position.y = 0
		if (get_owner().position.x > bounds.x - get_owner().dimensions.x):
			get_owner().position.x = bounds.x - get_owner().dimensions.x
		if (get_owner().position.y > bounds.y - get_owner().dimensions.y - taskbar_height):
			get_owner().position.y = bounds.y - get_owner().dimensions.y - taskbar_height

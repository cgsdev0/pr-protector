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

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		get_owner().position = get_global_mouse_position() + grabbed_offset
		get_owner().position.x = round(get_owner().position.x)
		get_owner().position.y = round(get_owner().position.y)
		if (get_owner().position.x < 1):
			get_owner().position.x = 1
		if (get_owner().position.y < 26):
			get_owner().position.y = 26
		if (get_owner().position.x > 640 - get_owner().dimensions.x):
			get_owner().position.x = 640 - get_owner().dimensions.x
		if (get_owner().position.y > 479 - get_owner().dimensions.y):
			get_owner().position.y = 479 - get_owner().dimensions.y

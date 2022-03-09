extends Control


onready var events = get_node("/root/Events")

# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect('open_window', self, "on_window_open")
	for window in get_children():
		var body = window.get_node("Body")
		if body:
			body.connect('move_to_top', self, 'move_window_to_top')	

func on_window_open(node):
	node.position = Vector2(40, 40)
	# short delay to get focus
	yield(get_tree().create_timer(0.1), "timeout")
	add_child(node)
	move_child(node.get_owner(), get_child_count() - 1)
	node.focus()
	var body = node.get_node("Body")
	if body:
		body.connect('move_to_top', self, 'move_window_to_top')
			
func move_window_to_top(node):
	for window in get_children():
			window.blur()
	move_child(node.get_owner(), get_child_count() - 1)
	
func _gui_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == 1:
		for window in get_children():
			window.blur()

extends Control


onready var events = get_node("/root/Events")

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	events.connect('open_window', self, "on_window_open")
	for window in get_children():
		if window is Control:
			continue
		var body = window.get_node("Body")
		if body:
			body.connect('move_to_top', self, 'move_window_to_top')	

func on_window_open(node):
	node.position = Vector2(80 + rng.randi_range(0, 50), 35 + rng.randi_range(0, 50))
	# short delay to get focus
	yield(get_tree().create_timer(0.1), "timeout")
	add_child(node)
	move_child(node.get_owner(), get_child_count() - 1)
	blur_all()
	node.focus()
	var body = node.get_node("Body")
	if body:
		body.connect('move_to_top', self, 'move_window_to_top')
			
func move_window_to_top(node):
	blur_all()
	move_child(node.get_owner(), get_child_count() - 1)

func blur_all():
	for window in get_children():
		if window is Control:
			continue
		window.blur()
	
func _gui_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == 1:
		blur_all()

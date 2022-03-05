extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for window in get_children():
		var body = window.get_node("Body")
		var title = window.get_node("Title")
		if body:
			body.connect('move_to_top', self, 'move_window_to_top')
		if title:
			title.connect('move_to_top', self, 'move_window_to_top')
		

func move_window_to_top(node):
	print_debug(node)
	move_child(node.get_owner(), get_child_count() - 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

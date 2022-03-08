extends Control

onready var events = get_node("/root/Events")


func _on_change_cursor(cursor):
	set_default_cursor_shape(cursor)

func _ready():
	events.connect("change_cursor", self, "_on_change_cursor")
	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal move_to_top

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed && (event.button_index == 1 || event.button_index == 2):
			accept_event()
			emit_signal('move_to_top', self)
			var was_focused = get_owner().focused
			get_owner().focused = true
			if !was_focused:
				get_owner().update()
			

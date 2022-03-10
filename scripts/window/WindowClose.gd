extends Control

onready var events = get_node("/root/Events")

func _gui_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == 1:
		if get_owner().focused:
			var top_owner = get_owner().get_parent()
			var ind = top_owner.get_child_count() - 2
			if ind >= 0 && !(top_owner is Viewport):
				top_owner.get_child(ind).focus()
		events.emit_signal("close_window")
		get_owner().queue_free()

func _draw():
	var title_height = margin_bottom - margin_top - 4
	var offset = 2
	draw_rect(Rect2(Vector2(offset, offset), Vector2(title_height, title_height)), Color.black, false)
	draw_line(Vector2(offset, offset), Vector2(offset + title_height, offset + title_height), Color.black)
	draw_line(Vector2(offset + title_height, offset), Vector2(offset, offset + title_height), Color.black)

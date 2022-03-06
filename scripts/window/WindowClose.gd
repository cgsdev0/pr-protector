extends Control


func _gui_input(event):
	if event is InputEventMouseButton && event.pressed:
		get_owner().queue_free()

func _draw():
	var title_height = margin_bottom - margin_top - 4
	var offset = 2
	draw_rect(Rect2(Vector2(offset, offset), Vector2(title_height, title_height)), Color.black, false)
	draw_line(Vector2(offset, offset), Vector2(offset + title_height, offset + title_height), Color.black)
	draw_line(Vector2(offset + title_height, offset), Vector2(offset, offset + title_height), Color.black)

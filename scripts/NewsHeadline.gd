extends Node2D
	
func _draw():
	var size = Vector2(640, 480)
	draw_rect(Rect2(position, size), Color.red)

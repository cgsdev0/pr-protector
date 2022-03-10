extends Control

onready var events = get_node("/root/Events")

var curr_time = 0
var flash = false

func _process(delta):
	if !visible:
		return
	curr_time += delta
	if curr_time > 7 && !flash:
		flash = true
		$AnimationPlayer.play("Flash")
	if flash:
		update()
		
func _gui_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == 1:
		if get_owner().focused:
			var top_owner = get_owner().get_parent()
			var ind = top_owner.get_child_count() - 2
			if ind >= 0 && !(top_owner is Viewport):
				top_owner.get_child(ind).focus()
		events.emit_signal("close_window")
		get_owner().queue_free()

func draw_round_rect(rect: Rect2, color: Color):
	var w = Vector2(1, 0)
	var h = Vector2(0, 1)
	var pos = rect.position
	var size = rect.size
	draw_line(pos, pos + size * w - w, color)
	draw_line(pos + h, pos + size * h, color)
	draw_line(pos + size * w + h, pos + size, color)
	draw_line(pos + size * h, pos + size - w, color)
	
func _draw():
	var title_height = margin_bottom - margin_top - 4
	var offset = 2
	var color = Color.black
	if flash:
		color = modulate
	draw_round_rect(Rect2(Vector2(offset, offset), Vector2(title_height, title_height)), color)
	draw_line(Vector2(offset, offset + 1), Vector2(offset + title_height - 1, offset + title_height), color)
	draw_line(Vector2(offset + title_height - 1, offset + 1), Vector2(offset, offset + title_height), color)

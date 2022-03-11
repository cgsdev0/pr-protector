extends Sprite

onready var events = get_node("/root/Events")

var prev_mouse_on_witness = false
var mouse_on_witness = false
var witness_grabbed = false
var witness_original_pos
var selected_state
var grab_offset = Vector2(0, -26)
var locked_in = false

var rng = RandomNumberGenerator.new()

func _ready():
	witness_original_pos = $Witness.position
	rng.randomize()
	var state = rng.randi_range(0, $States.get_child_count() - 1)
	events.emit_signal("select_state", $States.get_child(state).name)

func _input(event):
	if !get_owner().focused:
		return
	if event is InputEventMouseButton && event.button_index == 1:
		if mouse_on_witness && event.pressed:
			witness_grabbed = true
			$Witness.global_position = get_global_mouse_position() + grab_offset
		if witness_grabbed && !event.pressed:
			witness_grabbed = false
			print(selected_state)
			if !selected_state:
				$Witness.position = witness_original_pos
			else:
				locked_in = true
				if selected_state != get_owner().find_node("RelocationLabel").text:
					$AnimationPlayer.play("Shake")
					yield(get_tree().create_timer(0.5), "timeout")
					locked_in = false
					$Witness.position = witness_original_pos
				else:
					events.emit_signal("beat_captcha")
					$Witness/Sprite.play()
			
	if event is InputEventMouseMotion:
		if witness_grabbed:
			$Witness.global_position = get_global_mouse_position() + grab_offset
		mouse_on_witness = Geometry.is_point_in_polygon(
			event.position - $Witness/Polygon2D.global_position, $Witness/Polygon2D.polygon) && !locked_in

		if mouse_on_witness && !prev_mouse_on_witness && !locked_in:
			prev_mouse_on_witness = true
			$Witness.modulate = Color.green
			events.emit_signal("change_cursor", Input.CURSOR_MOVE)
		elif !mouse_on_witness && prev_mouse_on_witness && !witness_grabbed:
			prev_mouse_on_witness = false
			$Witness.modulate = Color.white
			events.emit_signal("change_cursor", Input.CURSOR_ARROW)
		
		var clear = true
		for state in $States.get_children():
			var polygon = state.get_node("Polygon2D")
			var mouse_in = Geometry.is_point_in_polygon(
				event.position-state.global_position + grab_offset, polygon.polygon)
			if mouse_in && witness_grabbed:
				state.modulate = Color.white
				selected_state = state.name
				clear = false
			else:
				state.modulate = Color.transparent
		if clear:
			selected_state = null

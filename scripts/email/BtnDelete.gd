extends TextureButton

onready var events = get_node("/root/Events")

var curr_time = 0
var was_visible = false

func _process(delta):
	if is_visible_in_tree() && !was_visible:
		curr_time = 0
		was_visible = true
	elif !is_visible_in_tree() && was_visible:
		was_visible = false
		$NagArrows.visible = false
		$AnimationPlayer.stop(true)
		modulate = Color.white
	if is_visible_in_tree():
		curr_time += delta
		if curr_time > 7:
			$NagArrows.visible = true
			$AnimationPlayer.play("Flash")
			
func _pressed():
	events.emit_signal("delete_email")

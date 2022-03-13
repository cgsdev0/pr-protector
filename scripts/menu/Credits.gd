extends ReferenceRect

func _on_Credits_mouse_entered():
	$AnimationPlayer.play("Slide")


func _on_Credits_mouse_exited():
	$AnimationPlayer.play_backwards("Slide")

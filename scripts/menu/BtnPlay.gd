extends Control

func _on_BtnPlay_mouse_entered():
	modulate = Color.red
	$AnimationPlayer.play("SlideIn")
	
func _on_BtnPlay_mouse_exited():
	modulate = Color.white
	$AnimationPlayer.play_backwards("SlideIn")

func _gui_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == 1:
		match name:
			"BtnPlay":
				get_tree().change_scene("res://main.tscn")
			"BtnFullscreen":
				OS.window_fullscreen = !OS.window_fullscreen
			"BtnQuit":
				get_tree().quit()

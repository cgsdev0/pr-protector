extends Control

signal soccer_game_start
	
func _gui_input(event):
	if event is InputEventMouseButton && event.button_index == 1 && event.pressed:
		emit_signal("soccer_game_start")
		visible = false

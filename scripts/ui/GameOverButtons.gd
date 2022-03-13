extends ReferenceRect

onready var data = get_node("/root/Data").data
onready var Score = get_node("/root/Score")
onready var events = get_node("/root/Events")

var starting_text
var top_parent

var cur_text
var changing = false

func _ready():
	top_parent = get_parent().get_parent()
	starting_text = $Subtitle.text
	match name:
		"BtnRetryReset":
			$Subtitle.text = $Subtitle.text.format({ "PRICE": str(data.tweakables.starting_score).pad_decimals(2) })
func _on_BtnRetry_mouse_entered():
	$Subtitle.modulate = Color.red

func _on_BtnRetry_mouse_exited():
	$Subtitle.modulate = Color.white

func _process(_delta):
	if !top_parent.visible:
		return
	if changing:
		return
	match name:
		"BtnRetry":
			var new_text = starting_text.format({ "PRICE": str(Score.prev_score).pad_decimals(2) })
			if new_text != $Subtitle.text:
				if get_parent().visible:
					changing = true
					yield(get_tree().create_timer(2.0), "timeout")
					$Subtitle.text = new_text
					changing = false
				else:
					$Subtitle.text = new_text
				
			
func _gui_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == 1:
		match name:
			"BtnRetryReset":
				events.emit_signal("reset_level", true)
				yield(get_tree().create_timer(1.5), "timeout")
				top_parent.visible = false
				get_parent().visible = false
			"BtnRetry":
				events.emit_signal("reset_level", false)
				yield(get_tree().create_timer(1.5), "timeout")
				top_parent.visible = false
				get_parent().visible = false
			"BtnMenu":
				events.emit_signal("reset_level", true)
				get_tree().paused = false
				get_tree().change_scene("res://menu.tscn")

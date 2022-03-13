extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var events = get_node("/root/Events")
onready var Score = get_node("/root/Score")

onready var font = preload("res://fonts/m5x7_med.tres")
export var padding = Vector2(16, 5)

export var outline_color: Color

var duration = 0
var target
var score

export var animate_duration = 0.7

# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("reset_level", self, "on_reset_level")
	score = Score.score
	target = score
	
func on_reset_level(_should_reset_score):
	score = Score.score
	target = score
	duration = 0
	update()
	
func _process(delta):
	if target != Score.score:
		target = Score.score
		duration = animate_duration
		if target < 0:
			target = 0.0
		else:
			update()
		
	var curr_score = score
	score = lerp(score, target, max(0, (animate_duration - duration) / animate_duration))
	if score < 0 or score == -0:
		score = 0.0
	duration -= delta
	if curr_score != score:
		update()
	

var outliners = [ Vector2(-1, 0), Vector2(1, 0), Vector2(0, -1), Vector2(0, 1)]
func _draw():
	var text = "$PKC " + str(score).pad_decimals(2)
	var size = font.get_string_size(text)
	var text_pos = Vector2(rect_size.x - size.x - padding.x, rect_size.y - size.y / 2 + padding.y)
	for offset in outliners:
		draw_string(font, text_pos + offset * 2, text, outline_color)
	
	var color = Color.white
	if score > target:
		color = Color.red
	if score < target:
		color = Color.green
	draw_string(font, text_pos, text, color)

		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

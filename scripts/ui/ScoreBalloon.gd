extends Node2D


onready var font = preload("res://fonts/m5x7_med.tres")

onready var events = get_node("/root/Events")

export var outline_color: Color = Color.black
export var up_color: Color = Color.green
export var down_color: Color = Color.red
var phase = 0
var outliners = [ Vector2(-1, 0), Vector2(1, 0), Vector2(0, -1), Vector2(0, 1)]
var speed = 400

var dests
var color
var up_dests = [Vector2(480, 30), Vector2(860, 530)]
var down_dests = [Vector2(480, 480), Vector2(860, 530)]
var jitter = Vector2(0, 0)
var change

func _ready():
	if change < 0:
		dests = down_dests
		color = down_color
	else:
		dests = up_dests
		color = up_color
		
	dests[0] += jitter

func _process(delta):
	var dest = dests[phase]
	position = position.move_toward(dest, speed * delta)
	if phase == 0:
		speed = max(0, speed - delta * 600)
	else:
		speed = min(1000, 1500 * delta + speed)
	if position == dest && phase == 1:
		events.emit_signal("price_change", change)
		queue_free()
	if phase == 0 && speed == 0:
		phase = 1
		
	
func _draw():
	var text = '' if change < 0 else '+'
	text += str(change).pad_decimals(2)
	var size = font.get_string_size(text)
	var text_pos = Vector2(0, 0)
	for offset in outliners:
		draw_string(font, text_pos + offset, text, outline_color)	
	draw_string(font, text_pos, text, color)

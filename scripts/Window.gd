tool
extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export var dimensions : Vector2
export var color : Color = Color.white
export var title : String

var title_height = 14
var font

# Called when the node enters the scene tree for the first time.
func _ready():
	font = load("res://fonts/m5x7_small.tres")
	pass # Replace with function body.

func _process(delta):
	self.get_child(0).margin_right = dimensions.x
	self.get_child(0).margin_bottom = dimensions.y
	self.get_child(0).margin_top = 0
	self.get_child(0).margin_left = 0
	# title bar
	self.get_child(1).margin_bottom = title_height
	self.get_child(1).margin_right = dimensions.x
	self.get_child(1).margin_top = 0
	self.get_child(1).margin_left = 0

	
func _draw():
	draw_rect(Rect2(Vector2(0,0), dimensions), Color.white)
	draw_rect(Rect2(Vector2(0,0), Vector2(dimensions.x, title_height)), color)
	draw_rect(Rect2(Vector2(dimensions.x - title_height + 2, 2), Vector2(title_height - 4,title_height - 4)), Color.black, false)
	draw_line(Vector2(0, title_height), Vector2(dimensions.x,title_height), Color.black)
	draw_rect(Rect2(Vector2(0,0), dimensions), Color.black, false)
	draw_string(font, Vector2(floor(dimensions.x / 2 - font.get_string_size(title).x / 2), title_height - 3), title, Color.white)

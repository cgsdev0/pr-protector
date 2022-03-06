tool
extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export var dimensions : Vector2
export var color : Color = Color.white
export var title : String
export var closable : bool

var title_height = 14
var font

var bodyNode
var titleNode
var closeNode

# Called when the node enters the scene tree for the first time.
func _ready():
	font = load("res://fonts/m5x7_small.tres")

func setClosable(is_closable: bool):
	self.closable = is_closable
	
func _process(delta):
	if !font:
		font = load("res://fonts/m5x7_small.tres")
	if !bodyNode:
		bodyNode = find_node("Body", false)
	if !titleNode:
		titleNode = bodyNode.find_node("Title", false)
	if !closeNode:
		closeNode = titleNode.find_node("WindowClose", false)
	
	closeNode.visible = self.closable
	
	bodyNode.margin_right = dimensions.x
	bodyNode.margin_bottom = dimensions.y
	bodyNode.margin_top = 0
	bodyNode.margin_left = 0
	# title bar
	titleNode.margin_bottom = title_height
	titleNode.margin_right = dimensions.x
	titleNode.margin_top = 0
	titleNode.margin_left = 0
	# close button
	closeNode.margin_bottom = title_height
	closeNode.margin_right = dimensions.x
	closeNode.margin_top = 0
	closeNode.margin_left = dimensions.x - title_height

	
func _draw():
	draw_rect(Rect2(Vector2(0,0), dimensions), Color.white)
	draw_rect(Rect2(Vector2(0,0), Vector2(dimensions.x, title_height)), color)
	draw_line(Vector2(0, title_height), Vector2(dimensions.x,title_height), Color.black)
	draw_rect(Rect2(Vector2(0,0), dimensions), Color.black, false)
	draw_string(font, Vector2(floor(dimensions.x / 2 - font.get_string_size(title).x / 2), title_height - 3), title, Color.white)

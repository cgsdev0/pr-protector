tool
extends Node2D



export var dimensions : Vector2
export var color : Color = Color.white
export var bg_color : Color = Color.white
export var title : String
export var closable : bool

var title_height = 14
var font

var bodyNode
var titleNode
var closeNode
var title_color

var focused

var focused_color = Color.black
var unfocused_color = Color("#4f4f4f")

# only used by photoshop windows
var photoshop_freeze = false
var photoshop_index = "moon_building"

func focus():
	focused = true
	update()

func blur():
	focused = false
	update()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	focused = false
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

func draw_round_rect(rect: Rect2, color: Color):
	var w = Vector2(1, 0)
	var h = Vector2(0, 1)
	var pos = rect.position
	var size = rect.size
	draw_line(pos, pos + size * w - w, color)
	draw_line(pos + h, pos + size * h, color)
	draw_line(pos + size * w + h, pos + size, color)
	draw_line(pos + size * h, pos + size - w, color)

func lighten(color: Color):
	return Color.darkgray
	
func _draw():
	var nudge = Vector2(1, 0)
	var shadow_color = Color(0,0,0, 0.1)
	draw_rect(Rect2(Vector2(6,6), dimensions - nudge), shadow_color)
	draw_rect(Rect2(Vector2(0,0), dimensions - nudge), bg_color)
	
	title_color = color
	var border_color = unfocused_color
	if focused:
		border_color = focused_color
	else:
		title_color = lighten(color)
		
	draw_rect(Rect2(Vector2(0,0), Vector2(dimensions.x, title_height) - nudge), title_color)
	draw_line(Vector2(0, title_height), Vector2(dimensions.x,title_height), border_color)
	draw_round_rect(Rect2(Vector2(0,0), dimensions), border_color)
	draw_string(font, Vector2(floor(dimensions.x / 2 - font.get_string_size(title).x / 2), title_height - 3), title, Color.white)

extends "Cutout.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var events = get_node("/root/Events")

var prev_mouse_in = false
var can_grab = false
var grabbed_offset

const MAX_COORD = pow(2,31)-1
const MIN_COORD = -MAX_COORD
var box # your polygon bounding box (Rect2)
var target_zone

func _ready():
	target_zone = get_owner().find_node("TargetZone")
	on_change_my_poly()

func minv(curvec,newvec):
	return Vector2(min(curvec.x,newvec.x),min(curvec.y,newvec.y))
func maxv(curvec,newvec):
	return Vector2(max(curvec.x,newvec.x),max(curvec.y,newvec.y))

func on_change_my_poly():
	var min_vec = Vector2(MAX_COORD,MAX_COORD)
	var max_vec = Vector2(MIN_COORD,MIN_COORD)
	for v in polygon:
		min_vec = minv(min_vec,v)
		max_vec = maxv(max_vec,v)
	box = Rect2(min_vec,max_vec-min_vec)
	
func _input(event):
	if event is InputEventMouseButton && event.button_index == 1:
		can_grab = event.pressed && mouse_in && is_cutout_complete() && get_owner().focused
		grabbed_offset = get_parent().position - get_global_mouse_position()

# returns true if innerPoly is completely contained within outerPoly
func is_contained(innerPoly, outerPoly, innerPos, outerPos):
	var outerPolyShifted = []
	for point in outerPoly:
		outerPolyShifted.append(point - innerPos + outerPos)
	var merged = Geometry.merge_polygons_2d(innerPoly, outerPolyShifted)

	# easy outs
	if (len(merged) != 1) || len(merged[0]) != len(outerPoly):
		return false

	# check deep equality of the polygons
	for i in len(outerPoly):
		var found_match = false
		# really, really deep
		for j in len(merged[0]):
			if outerPoly[i] != merged[0][j]:
				found_match = true
				break
		if !found_match:
			return false
	return true 
	
func _process(_delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		get_parent().position = get_global_mouse_position() + grabbed_offset
		get_parent().position.x = round(get_parent().position.x)
		get_parent().position.y = round(get_parent().position.y)
		if(get_parent().position.x + box.size.x > 461):
			get_parent().position.x = 461 - box.size.x
		if(get_parent().position.x < 83):
			get_parent().position.x = 83
		if(get_parent().position.y + box.size.y > 339):
			get_parent().position.y = 339 - box.size.y
		if(get_parent().position.y < 58):
			get_parent().position.y = 58
		# print(is_contained(polygon, target_zone.polygon, self.global_position, target_zone.global_position))
		return
	# process cursor state
	if !get_owner().focused:
		return
	if !is_cutout_complete():
		return
	if mouse_in && !prev_mouse_in:
		prev_mouse_in = true
		events.emit_signal("change_cursor", Input.CURSOR_MOVE)
	elif !mouse_in && prev_mouse_in:
		prev_mouse_in = false
		events.emit_signal("change_cursor", Input.CURSOR_ARROW)
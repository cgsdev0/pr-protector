extends "Cutout.gd"

var prev_mouse_in = false
var can_grab = false
var grabbed_offset
var dragged = false

const MAX_COORD = pow(2,31)-1
const MIN_COORD = -MAX_COORD
var box # your polygon bounding box (Rect2)
var target_zone

var wait_for_replacement = false

func on_freeze():
	challenge_success = is_contained(polygon, target_zone.polygon, self.global_position, target_zone.global_position)

func _ready():
	target_zone = get_owner().find_node("TargetZone")
	events.connect("photoshop_freeze", self, "on_freeze")
	on_change_my_poly()
	if name == "SAMPLE":
		var line = ""
		for point in target_zone.polygon:
			if len(line):
				line += ", "
			line += "Vector2" + str(point)
		print("\"target_zone\": ", "[", line, "],")
		print("\"target_zone_position\": Vector2", target_zone.position)
	

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

func _draw():
	#draw_rect(box, Color.red, false)
	# draw_rect(Rect2(Vector2(83 - get_parent().position.x - box.size.x, 58 - get_parent().position.y - box.size.y), Vector2(461 - 83, 400 - 58)), Color.aquamarine, false)
	pass
	
func _input(event):
	if event is InputEventMouseButton && event.button_index == 1:
		if !event.pressed && dragged:
			events.emit_signal("photoshop_enable_upload")
			
		can_grab = event.pressed && \
			mouse_in && \
			is_cutout_complete() && \
			get_owner().focused && \
			!get_owner().photoshop_freeze && \
			!wait_for_replacement
			
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
		dragged = true
		get_parent().position = get_global_mouse_position() + grabbed_offset
		get_parent().position.x = round(get_parent().position.x)
		get_parent().position.y = round(get_parent().position.y)
		if(get_parent().position.x + position.x + box.position.x + box.size.x > 436):
			get_parent().position.x = 436 - box.size.x - position.x - box.position.x
		if(get_parent().position.x + position.x + box.position.x < 59):
			get_parent().position.x = 59 - position.x - box.position.x
		if(get_parent().position.y + position.y + box.position.y + box.size.y > 308):
			get_parent().position.y = 308 - box.size.y - position.y - box.position.y
		if(get_parent().position.y + position.y + box.position.y < 27):
			get_parent().position.y = 27 - position.y - box.position.y
		if OS.is_debug_build():
			print(is_contained(polygon, target_zone.polygon, self.global_position, target_zone.global_position))
		return
	# process cursor state
	if !get_owner().focused:
		return
	if !is_cutout_complete() || wait_for_replacement:
		return
	if mouse_in && !prev_mouse_in:
		prev_mouse_in = true
		events.emit_signal("change_cursor", Input.CURSOR_MOVE)
	elif !mouse_in && prev_mouse_in:
		prev_mouse_in = false
		events.emit_signal("change_cursor", Input.CURSOR_ARROW)

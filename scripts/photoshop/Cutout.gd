extends Polygon2D


var mouse_in
var selected

var grabbed_point
var connections

func _ready():
	selected = false
	mouse_in = false
	grabbed_point = null
	connections = {}

func _draw():
	# draw outline on initial hover
	if mouse_in && !selected && get_owner().focused:
		for i in len(polygon) - 1:
			draw_line(polygon[i], polygon[i + 1], Color.green)
		draw_line(polygon[len(polygon) - 1], polygon[0], Color.green)
	
	if selected:
		# draw vertices
		for i in len(polygon):
			if is_completed(i):
				continue
			var point = polygon[i]
			if i == grabbed_point:
				draw_circle(point, 5, Color.green)
			else:
				draw_circle(point, 5, Color.red)
		
		# draw current connection drag line
		if grabbed_point != null:
			draw_line(polygon[grabbed_point], get_global_mouse_position() - self.global_position, Color.yellow, 2)
		
		# draw completed connection lines
		for i in connections:
			draw_line(polygon[smart_mod(i, len(polygon))], polygon[smart_mod((i + 1), len(polygon))], Color.green, 2)

# returns true when a point has both edges completed
func is_completed(i: int):
	if i == len(polygon) - 1:
		return connections.has(i - 1) && connections.has(-1)
	return connections.has(i) && connections.has((i - 1) % len(polygon))
	
static func smart_mod(a, b):
	if a < 0:
		return a + b
	return a % b
	
func _input(event):
	if event is InputEventMouseMotion:
		var new_mouse_in = Geometry.is_point_in_polygon(event.position-self.global_position,polygon)
		if new_mouse_in != mouse_in:
			mouse_in = new_mouse_in
			update()
		if grabbed_point != null:
			# check if we bumped into an unconnected node
			for i in [smart_mod((grabbed_point - 1), len(polygon)), smart_mod((grabbed_point + 1), len(polygon))]:
				if is_completed(i):
					continue
				var point = polygon[i]
				if (event.position - self.global_position).distance_to(point) <= 7:
					# create the connection
					if abs(grabbed_point - i) > 1:
						# edge case for final connection
						connections[-1] = true
					else:
						connections[min(i, grabbed_point)] = true
					if is_completed(i):
						grabbed_point = null
					else:
						grabbed_point = smart_mod(i, len(polygon))
			update()
	if event is InputEventMouseButton:
		# initial selection of the polygon
		if event.pressed && !selected && mouse_in && get_owner().focused:
			selected = true
		# check if we mouse down'd on a point
		elif event.pressed && selected && grabbed_point == null:
			for i in len(polygon):
				if is_completed(i):
					continue
				var point = polygon[i]
				if (event.position - self.global_position).distance_to(point) <= 7:
					grabbed_point = i
					break
		elif !event.pressed && grabbed_point != null:
			grabbed_point = null
		update()
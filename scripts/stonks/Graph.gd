extends Control

onready var Events = get_node("/root/Events")
onready var Score = get_node("/root/Score")
onready var font = preload("res://fonts/m5x7_small.tres")

var scores = []
var curr_time = 0

var tick = -1
var tick2 = -1

var time_range = 40

var suggested_window = 10

var bounds
var prev_min
var prev_max

export var label_colors: Color = Color.black
export var bg_color: Color = Color.white

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	
func _physics_process(delta):
	curr_time += delta
	if len(scores) == 0 or scores[-1].score != Score.score:
		var scoremap = { time = curr_time, score = Score.score }
		if len(scores) == 0:
			scoremap.time -= time_range
		while len(scores) >= 250:
			scores.pop_front()
		scores.append(scoremap)
	if tick < curr_time:
		tick = floor(curr_time) + 1.5
		scores.append({ time = curr_time, score = 0.0 if Score.score == 0.0 else Score.score + rng.randf_range(-0.3, 0.8)})
	
	bounds = calcMinMax()
	bounds.min_score = min(bounds.average - suggested_window / 2, bounds.min_score - 2)
	bounds.max_score = max(bounds.average + suggested_window / 2, bounds.max_score + 2)
	bounds.max_time = curr_time
	bounds.min_time = curr_time - time_range
	
	if prev_min != null:
		var factor = min(delta, max(1, delta * abs(bounds.min_score - prev_min) * 5000))
		bounds.min_score = lerp(prev_min, bounds.min_score, factor)
	if prev_max != null:
		var factor = min(delta, max(1, delta * abs(bounds.max_score - prev_max) * 5000))
		bounds.max_score = lerp(prev_max, bounds.max_score, factor)
	prev_min = bounds.min_score
	prev_max = bounds.max_score
#	if tick2 < curr_time:
#		tick2 = curr_time + 0.8
	update()

func color_by_score(score):
	if score > 100:
		return Color.green
	if score > 80:
		return Color.greenyellow
	if score > 60:
		return Color.yellow
	if score > 40:
		return Color.orange
	if score > 20:
		return Color.orangered
	return Color.red
	
func _draw():
	# NOTE (Brian) to draw the graph, we effectively scale all of the "score values"
	# between 0.0 and 1.0, and create vectors for each score entry between this range.
	# When drawing, real resolutions are gathered between
	#
	# Additionally, if you're "doing well" (needs to be defined), the background and
	# various parts of the graph will be drawn as green.
	#
	# TODO (Brian) the real optimization to do is perform this scaling
	# and whatnot on ingestion.
	
	var H = get_owner().title_height + 1
	var dimensions = get_owner().dimensions
	
	var label_size = font.get_string_size("XXXX")
	var pos = Vector2(label_size.x,  H)
	var size = Vector2(dimensions.x - label_size.x - 1, dimensions.y - H)
	
	var rect_adjust = Vector2(label_size.x, 0)
	draw_rect(Rect2(pos - rect_adjust, size + rect_adjust), bg_color)
	
	# draw the scale
	draw_line(pos + Vector2(0, 3), Vector2(pos.x, pos.y + size.y - 4), label_colors)
	
	if len(scores) <= 1:
		return
	
	var bounds_mid = (bounds.max_score - bounds.min_score) / 2 + bounds.min_score
		
	var top_label = str(round(bounds.max_score))
	var mid_label = str(round(bounds_mid))
	var bottom_label = str(round(bounds.min_score))
	
	rect_adjust = Vector2(font.get_string_size(top_label).x + 6, 0)
	draw_string(font, pos - rect_adjust + Vector2(3, label_size.y), top_label, label_colors)
	rect_adjust = Vector2(font.get_string_size(mid_label).x + 6, 0)
	draw_string(font, pos - rect_adjust + Vector2(3, (size.y / 2) - label_size.y / 4 + 5), mid_label, label_colors)
	rect_adjust = Vector2(font.get_string_size(bottom_label).x + 6, 0)
	draw_string(font, pos - rect_adjust + Vector2(3, size.y - label_size.y / 2 - 3), bottom_label, label_colors)
	# print("min score ", minScore, " max score ", maxScore)
	


	var gridlines = 6
	for i in gridlines:
		var h = (size.y - 8) / (gridlines - 1)
		var offset = Vector2(0, h * i)
		draw_line(pos + Vector2(0, 3) + offset, pos + Vector2(0, 3) + Vector2(size.x - 3, 0) + offset, label_colors)
	
	var gridbars = 4
	for i in range(1, gridbars):
		var w = (size.x - 3) / (gridbars - 1)
		var offset = Vector2(w * i - int(curr_time / (time_range / (gridbars - 1)) * w) % int(w), 0)
		draw_line(pos + Vector2(0, 3) + offset, pos + Vector2(0, 3) + Vector2(0, size.y - 8) + offset, label_colors)
		
	var prev
	for i in scores:
		var score_value = (i.score - bounds.min_score) / (bounds.max_score - bounds.min_score)
		var time_value = (i.time - bounds.min_time) / (bounds.max_time - bounds.min_time)
		if prev && time_value > 0:
			if prev.time < 0:
				var slope = (score_value - prev.score) / (time_value - prev.time)
				var b = score_value - slope * time_value
				prev.score = b
				prev.time = 0
				pass
			var from = pos + Vector2(prev.time * size.x, (1 - prev.score) * size.y)
			var to = pos + Vector2(time_value * size.x, (1 - score_value) * size.y)
			to.y = max(pos.y, min(to.y, size.y + pos.y))
			from.y = max(pos.y, min(from.y, size.y + pos.y))
			draw_line(from, to, color_by_score(i.score), 2)
		prev = { "score": score_value, "time": time_value }

func calcMinMax():
	var result = { "average": 0, "min_score": scores[-1].score, "max_score": scores[-1].score, "min_time": scores[-1].time, "max_time": scores[-1].time }
	var count = 0
	for i in scores:
		if i.time < curr_time - time_range:
			continue
		count += 1
		result.average += i.score
		if i.score < result.min_score:
			result.min_score = i.score
		if i.score > result.max_score:
			result.max_score = i.score
#		if i.time < result.min_time:
#			result.min_time = i.time
#		if i.time > result.max_time:
#			result.max_time = i.time
	result.average /= max(count, 1)
	return result

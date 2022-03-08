extends Control

onready var Events = get_node("/root/Events")
onready var Score = get_node("/root/Score")

var scores = []
var curr_time = 0

func _process(delta):
	curr_time += delta
	if len(scores) == 0 or scores[-1].score != Score.score:
		var scoremap = { time = curr_time, score = Score.score }
		if len(scores) >= 50:
			scores.pop_front()
		scores.append(scoremap)
		update()

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
	
	var pos = Vector2(4,  H + 4)
	var size = Vector2(dimensions.x - 9, dimensions.y - 9 - H)
	
	draw_rect(Rect2(pos, size), Color.darkgray)
	
	# draw the scale
	draw_line(Vector2(pos.x + 1, pos.y), Vector2(pos.x + 1, size.y), Color.black, 2.0)
	
	if len(scores) <= 1:
		return
	
	var minScore = minScore() * 1.0
	var maxScore = maxScore() * 1.0
	
	var scaled = []
	
	print("min score ", minScore, " max score ", maxScore)
	
	for i in scores:
		var value = (i.score - minScore) / (maxScore - minScore)
		print("score ", i.score, " scaled ", value)
		scaled.append(value)

func minScore():
	var minval = scores[0].score
	for i in scores:
		if i.score < minval:
			minval = i.score
	return minval

func maxScore():
	var maxval = scores[0].score
	for i in scores:
		if i.score > maxval:
			maxval = i.score
	return maxval

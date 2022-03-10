extends Control


onready var events = get_node("/root/Events")
onready var Score = get_node("/root/Score")
onready var data = get_node("/root/Data").data

# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("win_level", self, "on_pause")
	events.connect("next_level", self, "on_unpause")



func on_pause(level):
	get_tree().paused = true
	$CenterContainer/Node2D/Body.bbcode_text = """
	
	
Day {DAY} - [color=#51a83c]SUCCESS[/color]
	
The markets have closed for the day, and PKC is still in business. Nice!

Closing Stock Price: [color={STOCK_COL}]${STOCK_PRICE} ({STOCK_CHANGE})[/color]

Mistakes: [color=red]{MISTAKES}[/color]
Successes: [color=#51a83c]{SUCCESSES}[/color]


Keep up the hard work! Remember - we're all a part of the PKC family!
""".format({ 
		"DAY": level.index + 1,
		"STOCK_COL": "red" if Score.prev_score > Score.score else "#51a83c",
		"STOCK_PRICE": str(Score.score).pad_decimals(2),
		"STOCK_CHANGE": ('' if Score.prev_score > Score.score else '+') + str(Score.score - Score.prev_score).pad_decimals(2),
		"MISTAKES": str(Score.mistakes),
		"SUCCESSES": str(Score.successes),
	})
	self.modulate = Color.transparent
	$AnimationPlayer.play("Fade")
	visible = true
	
func on_unpause():
	get_tree().paused = false
	yield(get_tree().create_timer(1.0), "timeout")
	visible = false

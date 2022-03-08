extends Node

# NOTE (Sarah)
# So, you, continuity between levels of share price, if you fail a level,
# we should give you options to restart the level with an increase in share price,
# the option to NOT (Brian), and the option to restart the entire game.

onready var Events = get_node("/root/Events")

var score = 50

func _ready():
	Events.connect("price_change", self, "on_price_change")

func on_price_change(amount):
	score += amount

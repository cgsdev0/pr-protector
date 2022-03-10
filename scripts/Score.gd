extends Node

# NOTE (Sarah)
# So, you, continuity between levels of share price, if you fail a level,
# we should give you options to restart the level with an increase in share price,
# the option to NOT (Brian), and the option to restart the entire game.

onready var Events = get_node("/root/Events")

var score = 90.0

# various game state
var task_emails = 0
var junk_emails = 0
var task_windows = 0

func _ready():
	Events.connect("price_change", self, "on_price_change")
	Events.connect("insert_email", self, "on_change_email_count", [1])
	Events.connect("email_link", self, "on_change_email_count", [{"link": true}, -1])
	Events.connect("delete_email", self, "on_change_email_count", [{}, -1])
	Events.connect("open_window", self, "on_change_window_count", [1])
	Events.connect("close_window", self, "on_change_window_count", [{}, -1])

func on_price_change(amount):
	score = max(0.0, score + amount)

func print_game_state():
	print ("JUNK EMAILS: ", junk_emails)
	print ("TASK EMAILS: ", task_emails)
	print ("TASK WINDOWS: ", task_windows)
	
func on_change_email_count(email, count):
	if email.has("link"):
		task_emails += count
	else:
		junk_emails += count
	print_game_state()

func on_change_window_count(node, count):
	task_windows += count
	print_game_state()

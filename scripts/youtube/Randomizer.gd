extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var titles = [
"The Dirty Truth About M&S",
"Who TRULY Runs Mann & Son?",
"The History of Mann & Son ANIMATED",
"Let's Play #6: Em n' Ess bad",
"M&S Crappy Movie Marathon",
"Top 10 Companies You need to know about.",
"Mann & Son has failed us and we need to do something about it.",
"we need to talk about m&s...",
"M&S fired my mom :/",
"We bought DANGEROUS items from M&S",
"Crashing my new M&S Supercar! WATCH TIL' THE END!",
"TOP 5 WORST CEO'S",
"How I embarrassed my BORING BOSS!",
"Whistleblower Tells All in M&S Exposé",
"M&S has a Problem with Me...",
"Keep Mann & Son out of FRANCE!",
"Product Comparisons: M&S vs Generic",
"Sooooo I bought the M&S Twin Cycle :I ...",
"DON'T GET YOUR BLOOD TESTED IN AN M&S CLINIC!!!",
"Daily Vlog #504 | m and s still sucks lol",
"Already Fixing my M&S TV",
"\"Swords of Fortune\" is NOT worth $60! STOP GIVING M&S YOUR MONEY.",
"\"Magical Hen\" is the newest M&S trashfire",
"\"M&S+\" is a SCAM!",
"I bought the M&S-60DSLR so you wouldn't have to and it's...oof",
"How to buy M&S Fashion for Cheap",
"Mann & Son Deep Dive: The Toxicity goes Deep",
"The Boycott of the Century Begins >:D"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	titles.shuffle()
	find_node("VideoTitle").text = titles[0]

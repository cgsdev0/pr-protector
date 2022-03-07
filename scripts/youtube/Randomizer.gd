extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var titles = [
"The Dirty Truth About PKC",
"Who TRULY Runs PKC?",
"The History of PKC ANIMATED",
"Let's Play #6: Pee Kay See bad",
"PKC Crappy Movie Marathon",
"Top 10 Companies You need to know about.",
"PKC has failed us and we need to do something about it.",
"we need to talk about PKC...",
"PKC fired my mom :/",
"We bought DANGEROUS items from PKC",
"Crashing my new PKC Supercar! WATCH TIL' THE END!",
"TOP 5 WORST CEOs",
"How I embarrassed my BORING BOSS!",
"Whistleblower Tells All in PKC Exposé",
"PKC has a Problem with Me...",
"Keep PKC out of FRANCE!",
"Product Comparisons: PKC vs Generic",
"Sooooo I bought the PKC Twin Cycle :I ...",
"DON'T GET YOUR BLOOD TESTED IN AN PKC CLINIC!!!",
"Daily Vlog #504 | p k c still sucks lol",
"Already Fixing my PKC TV",
"\"Swords of Fortune\" is NOT worth $60! STOP GIVING PKC YOUR MONEY.",
"\"Magical Hen\" is the newest PKC trashfire",
"\"PKC+\" is a SCAM!",
"I bought the PKC-60DSLR so you wouldn't have to and it's...oof",
"How to buy PKC Fashion for Cheap",
"PKC Deep Dive: The Toxicity goes Deep",
"The Boycott of the Century Begins >:D"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	titles.shuffle()
	find_node("VideoTitle").text = titles[0]

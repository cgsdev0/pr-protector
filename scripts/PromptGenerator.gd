extends Node

# NOTE (Brian) here are the gross things about this
# - the keys between the replacements and the actual 'data' object aren't the same

onready var data = get_node("/root/Data").data

var generated = []
var curr = 0
var MAX_PROMPTS = 1000

var rng = RandomNumberGenerator.new()

# _ready : called the first time
func _ready():
	rng.randomize()
	generate_list()
	pass

# _process : called every frame
# func _process(delta):
#	pass

func next_prompt():
	var prompt = generated[curr % len(generated)]
	curr += 1
	return prompt

func generate_list():
	for _i in range(1, MAX_PROMPTS):
		var prompt = data["issues"][rand_idx(data["issues"])].text
		generated.append(get_prompt(prompt))

func get_prompt(template):
	var x = {};
	var prompt = template;
	
	x["<COMPANYNAME>"] = data["companyName"]
	x["<CURRENTYEAR>"] = OS.get_datetime()["year"]
	x["<PASTYEAR>"] = (rng.randi_range(1900, x["<CURRENTYEAR>"] - 1))
	x["<QUANTITY>"] = (rng.randi_range(0, 100))
	x["<COUNTRY>"] = get_rand_data("countries").name
	x["<CONTRABAND>"] = get_rand_data("contraband").name
	x["<MOVIENAME>"] = get_rand_data("movieName").name
	
	var performBad = get_rand_data("performBad")
	
	x["<PERFBAD_PAST>"] = performBad.past
	x["<PERFBAD_PASTPERFECT>"] = performBad.pastPerfect
	x["<PERFBAD_PERFECT>"] = performBad.perfect
	x["<PERFBAD_FUTURE>"] = performBad.future
	x["<PERFBAD_FUTUREPERFECT>"] = performBad.futurePerfect
	
	var performGood = get_rand_data("performGood")

	x["<PERFGOOD_PAST>"] = performGood.past
	x["<PERFGOOD_PASTPERFECT>"] = performGood.pastPerfect
	x["<PERFGOOD_PERFECT>"] = performGood.perfect
	x["<PERFGOOD_FUTURE>"] = performGood.future
	x["<PERFGOOD_FUTUREPERFECT>"] = performGood.futurePerfect
	
	for k in x.keys():
		prompt = prompt.replace(k, x[k])
		
	print(prompt)
	
	return prompt

func get_rand_data(key):
	return data[key][rand_idx(data[key])]
	
func rand_idx(arr):
	return rng.randi_range(0, len(arr) - 1)

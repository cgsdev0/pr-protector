extends Node

# NOTE (Brian) here are the gross things about this
# - the keys between the replacements and the actual 'data' object aren't the same
# - the verb replacement thing might actually just be a really bad idea

onready var data = get_node("/root/Data").data

const PROMPT_REDDIT = "reddit"
const PROMPT_TWITTER_GOOD = "twitterGood"
const PROMPT_TWITTER_BAD = "twitterBad"
const PROMPT_YOUTUBE = "youtube"

const RAND_USERNAME = "usernames"

var generated = {
	PROMPT_REDDIT = {},
	PROMPT_TWITTER_BAD = {},
	PROMPT_TWITTER_GOOD = {},
	PROMPT_YOUTUBE = {}
}

var rng = RandomNumberGenerator.new()

# _ready : called the first time
func _ready():
	rng.randomize()
	generated[PROMPT_REDDIT] = generate_list(PROMPT_REDDIT)
	generated[PROMPT_TWITTER_BAD] = generate_list(PROMPT_TWITTER_BAD)
	generated[PROMPT_TWITTER_GOOD] = generate_list(PROMPT_TWITTER_GOOD)
	generated[PROMPT_YOUTUBE] = generate_list(PROMPT_YOUTUBE)
	
	var good = 0
	var bad = 0
	for prompt in generated[PROMPT_REDDIT].array:
		if prompt.isgood:
			good += 1
		else:
			bad += 1
	print("good: ", good)
	print("bad:  ", bad)

# _process : called every frame
# func _process(delta):
#	pass

func next_prompt(kind):
	if generated[kind].index >= len(generated[kind].array):
		generated[kind] = generate_list(kind)
	var result = generated[kind].array[generated[kind].index]
	generated[kind].index += 1
	return result

func generate_list(key):
	var arr = []
	for prompt in data[key]:
		if prompt != null:
			arr.append(make_prompt(prompt))
	randomize()
	arr.shuffle()
	return { "array": arr, "index": 0 }

func make_prompt(template):
	var x = {};

	var prompt = template.text;
	
	x["<COMPANYNAME>"] = data["companyName"]
	x["<LONGCOMPANYNAME>"] = data["longCompanyName"]
	
	x["<COMPETITORNAME>"] = data["competitorName"]

	x["<CURRENTYEAR>"] = OS.get_datetime()["year"]
	x["<PASTYEAR>"] = (rng.randi_range(1900, x["<CURRENTYEAR>"] - 1))
	x["<QUANTITY>"] = (rng.randi_range(2, 100))

	x["<COUNTRY>"] = get_rand_data("countries").name
	x["<CURRENCY>"] = get_rand_data("currencies").name
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
		
	var ofTheKing = template.duplicate(true)
	
	ofTheKing.text = prompt
	
	return ofTheKing

func get_rand_data(key):
	if len(data[key]) == 0:
		return null
	return data[key][rand_idx(data[key])]
	
func rand_idx(arr):
	return rng.randi_range(0, len(arr) - 1)

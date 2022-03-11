extends Control

var confirmed = false
var cached_index
var correct_tweet = 3
var tweets = []

onready var events = get_node("/root/Events")
onready var PromptGenerator = get_node("/root/PromptGenerator")
onready var Score = get_node("/root/Score")

var rng = RandomNumberGenerator.new()

func _ready():
	events.connect("tweet_clicked", self, "on_tweet_clicked")
	
	rng.randomize()
	
	# 3 good, 1 bad
	for i in 3:
		var good_tweet = PromptGenerator.next_prompt(PromptGenerator.PROMPT_TWITTER_GOOD)
		good_tweet.is_bad = false
		tweets.append(good_tweet)
		
	var bad_tweet = PromptGenerator.next_prompt(PromptGenerator.PROMPT_TWITTER_BAD)
	bad_tweet.is_bad = true
	tweets.append(bad_tweet)
	
	# mix em all up
	randomize()
	tweets.shuffle()
	
	for i in len(tweets):
		# which one was the bad one again???
		if tweets[i].is_bad:
			correct_tweet = i
			
		var tw = $Tweets.get_child(i)
		tw.get_node("Tweet").text = tweets[i].text
		tw.get_node("Timestamp").text = str(rng.randi_range(4, 11)) + " years ago"
		
	# randomize profile
	var followers_base = rng.randi_range(10, 99)
	var followers_post = rng.randi_range(1, 9)
	var who = PromptGenerator.get_rand_data(PromptGenerator.RAND_USERNAME)
	$TwitterHeader/Followers.text = "%d.%dK Followers" % [followers_base, followers_post]
	$TwitterHeader/Username.text = "@%s" % who
	$TwitterHeader/AvatarColor.modulate = Color.from_hsv(rng.randf_range(0.0, 6.0), 0.7, 0.8)
	
func on_tweet_clicked(index):
	if !confirmed:
		$Confirm.visible = true
		cached_index = index
	else:
		reshare_tweet(index)

func reshare_tweet(index):
	var tweet = $Tweets.get_child(index)
	if index != correct_tweet:
		tweet.disabled = true
		tweet.mouse_default_cursor_shape = Control.CURSOR_ARROW
		tweet.color = tweet.my_color
		tweet.get_node("WrongTweet").visible = true
		Score.complete_task("twitter", false)
	else:
		Score.complete_task("twitter", true)
		tweet.get_node("CorrectTweet").visible = true
		get_owner().setClosable(true)
		for t in $Tweets.get_children():
			t.disabled = true
			t.mouse_default_cursor_shape = Control.CURSOR_ARROW
			tweet.color = tweet.my_color

func _on_BtnShare_pressed():
	confirmed = true
	reshare_tweet(cached_index)

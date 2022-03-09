extends Node

var data = {
	"contraband": [
		{
			"name": "money"
		},
		{
			"name": "drugs"
		},
		{
			"name": "Cuban cigars"
		},
		{
			"name": "Kinder Chocolate Egg"
		},
		{
			"name": "guns"
		},
		{
			"name": "oil"
		}
	],
	"currencies": [
		{
			"name": "dollars"
		},
		{
			"name": "pesos"
		},
		{
			"name": "vbucks"
		},
		{
			"name": "bitcoin"
		},
		{
			"name": "ethereum"
		}
	],
	"companyName": "PKC",
	"longCompanyName": "Peterson, Kain, and Cousins",
	"performBad": [
		{
			"past": "flopped",
			"pastPerfect": "had flopped",
			"perfect": "has flopped",
			"present": "flops",
			"future": "will flop",
			"futurePerfect": "will have flopped"
		},
		{
			"past": "sucked",
			"pastPerfect": "had sucked",
			"perfect": "has sucked",
			"present": "sucks",
			"future": "will suck",
			"futurePerfect": "will have sucked"
		}
	],
	"performGood": [
		{
			"past": "rocked",
			"pastPerfect": "had rocked",
			"perfect": "has rocked",
			"present": "rocks",
			"future": "will rock",
			"futurePerfect": "will have rocked"
		}
	],
	"movieName": [
		{
			"name": "The Rats"
		},
		{
			"name": "Awake in Arlington"
		},
		{
			"name": "Lord of the (Onion) Rings"
		},
		{
			"name": "Slow and the Stupendous"
		}
	],
	"reddit": [
		# positive reddit posts
		{
			"isgood": true,
			"text": "I love my new arm! Thanks <COMPANYNAME>!"
		},
		{
			"isgood": true,
			"text": "The new <COMPANYNAME> restaurant is heckin fancy :3"
		},
		{
			"isgood": true,
			"text": "Copped the new <COMPANYNAME> Templar Kicks"
		},
		{
			"isgood": true,
			"text": "I saved so much with that <COMPANYNAME> coupon app! WOOOOOO"
		},
		{
			"isgood": true,
			"text": "I WON THE <COMPANYNAME> SPACESHIP RAFFLE HOLY CRAP!!"
		},
		{
			"isgood": true,
			"text": "<COMPANYNAME> reveals the future of virtual reality!"
		},
		{
			"isgood": true,
			"text": "God bless the <COMPANYNAME> Cinematic Universe <3"
		},
		{
			"isgood": true,
			"text": "My body is so ready for <COMPANYNAME> Con!"
		},
		{
			"isgood": true,
			"text": "Celebrating my 37th at the <COMPANYNAME> Trampoline Arena :)"
		},
		# negative reddit posts
		{
			"isgood": false,
			"text": "<COMPANYNAME> dumps <QUANTITY> million barrels of oil in the Pacific. Updoot for visibility!"
		},
		{
			"isgood": false,
			"text": "<COMPANYNAME> in the news again after CFO is caught stealing candy (again!)"
		},
		{
			"isgood": false,
			"text": "How does <COMPANYNAME> keep getting away with it??"
		},
		{
			"isgood": false,
			"text": "TIL that in <PASTYEAR>, <COMPANYNAME> was caught smuggling money through <COUNTRY>."
		},
		{
			"isgood": false,
			"text": "'<LONGCOMPANYNAME>' caught smuggling tacos during taco drought"
		},
		{
			"isgood": false,
			"text": "<COMPANYNAME> executive caught money laundering <CURRENCY>"
		},
		{
			"isgood": false,
			"text": "Why does <COMPANYNAME> keep greenlighting awful movies?? :("
		},
		{
			"isgood": false,
			"text": "Who even runs <LONGCOMPANYNAME> anymore? Is it just robots doing everything?"
		},
		{
			"isgood": false,
			"text": "The <COMPANYNAME> Game Jam was crap this year. What a joke…"
		},
		{
			"isgood": false,
			"text": "I've never seen so much corporate propaganda in the <COMPANYNAME> Film Fest :/"
		},
		{
			"isgood": false,
			"text": "<LONGCOMPANYNAME> new restaurant rated the worst restaurant of all time"
		},
		# {
		#     "isgood": false,
		#     "text": "Powerful new pictures from the <COMPANYNAME> land conflict surface:"
		# },
		{
			"isgood": false,
			"text": "This is how <LONGCOMPANYNAME> treat their 10+ tenured employees:"
		},
		{
			"isgood": false,
			"text": "<COMPANYNAME> Exec cries during roast"
		},
		{
			"isgood": false,
			"text": "\"Massive\" car crash caused by \"<COMPANYNAME> CEO\" claims victim"
		},
		{
			"isgood": false,
			"text": "500 Passenger Flight forced to turnaround because of <LONGCOMPANYNAME> Exec"
		},
		{
			"isgood": false,
			"text": "There's some corny businessman at this bar playing guitar to any girl that looks at him??"
		},
		{
			"isgood": false,
			"text": "Why can my children buy knives from the <COMPANYNAME> online store!?"
		},
		{
			"isgood": false,
			"text": "How to Unsubscribe from any <COMPANYNAME> robocall!"
		},
		{
			"isgood": false,
			"text": "I can't access any <COMPANYNAME> website unless I turn off my adblock? Can anyone help?"
		},
		{
			"isgood": false,
			"text": "My brand new <COMPANYNAME> Ultralux Car exploded?? NANI??"
		},
		{
			"isgood": false,
			"text": "That new Ultraguy flick by /u/<COMPANYNAME> was absolute TRASH"
		},
		{
			"isgood": false,
			"text": "Who's <COMPANYNAME> luxury company car is this?"
		},
		{
			"isgood": false,
			"text": "Uhhhh... <COMPANYNAME> is selling laser weapons to aliens?? Wuuuuut?"
		},
		{
			"isgood": false,
			"text": "Is <COMPANYNAME> dropping an asteroid on Australia? Anyone seeing this??"
		},
		{
			"isgood": false,
			"text": "Why does this dinosaur have the \"<COMPANYNAME>\" logo on it..."
		},
		{
			"isgood": false,
			"text": "New archeological findings report a cave-painting that looks like the <COMPANYNAME> logo..."
		},
		{
			"isgood": false,
			"text": "mY <COMPANYNAME> aUgmeNNTAatioN 1ss mALfuNctioNIng. HeLLppp"
		},
		{
			"isgood": false,
			"text": "M&S literally stole 9.8B <CURRENCY> from <COUNTRY> and no one is talking about it??"
		},
		{
			"isgood": false,
			"text": "NEWS: <COMPANYNAME> Acquires Literally Every Movie + TV Studio for a Meager 5 Trillion; Denies it is a Monopoly"
		}
	],
	"twitterGood": [
		{
			"text": "Fast and Furious is a great franchise",
		},
		{
			"text": "Super excited to attend a con this year!"
		},
		{
			"text": "I love horses"
		},
		{
			"text": "I want @vindiesel to make a new game already!"
		},
		{
			"text": "When are street sharks coming back?"
		},
		{
			"text": "What music do you guys listen to?"
		},
		{
			"text": "My favorite birds are penguins! :3"
		},
		{
			"text": "Having our 16th baby #clowncar"
		},
		{
			"text": "Llamas or Alpacas, Who would win in a fight?"
		},
		{
			"text": "Has anyone been skydiving before? It sounds really scary"
		},
		{
			"text": "@TwitterSupport i think my account got hacked??? Help"
		},
		{
			"text": "Stop what you're doing and watch this new @pewdiepie video. Now."
		},
		{
			"text": "Twitter is dead, change my mind"
		},
		{
			"text": "Why is no one talking about this???"
		},
		{
			"text":"Just reached 500 followers! Thank you so much!!"
		},
		{
			"text": "thinking about taking up knitting. Anyone have any tips?"
		},
		{
			"text": "Best Action Figure of the year?"
		},
		{
			"text": "Retweet to get a chance to win a case of V Fuel"
		},
		{
			"text": "What that dog doin? :3"
		},
		{
			"text": "LEGO is costing too much these days oof..."
		},
		{
			"text": "#movieoftheweek"
		},
		{
			"text": "Is the new superhero movie out yet?"
		},
		{
			"text": "Someone hold me I'm scared"
		},
		{
			"text": "Wish me luck at the tournament tomorrow night! #nervous"
		},
		{
			"text": "I miss Mr. Humpersnackle <3"
		},
		{
			"text": "This is easy! Pshhh!"
		},
		{
			"text": "Just spent a month off social media. Good to be back"
		},
		{
			"text": "What color of socks should I were today"
		},
		{
			"text": "I'm totally gonna marathon the new @JexseSox lets play later!"
		},
		{
			"text": "Should I buy the new Gamestation or the X Cube Series Y : Electric Boogaloo "
		},
		{
			"text": "Wow…"
		},
		{
			"text": "I'm speechless rn…holy crap!"
		},
		{
			"text": "Did anyone see that? Was it a UFO? #theyarewatching"
		},
		{
			"text": "Am I doing this right?"
		},
		{
			"text": "I hope this gets 100 likes!"
		},
		{
			"text": "50 likes and I'll do a backlip #arachnaman"
		},
		{
			"text": "What should I name my new puppy?"
		},
		{
			"text": "Today is our 4th month anniversary #together4ever"
		},
		{
			"text": "I ducking hate autocorrect!"
		},
		{
			"text": "Anyone eat at that new restaurant between 6th and 9th?"
		},
		{
			"text":"Fave holiday? Mine is crimbus."
		},
		{
			"text": "Anyone see the news lately?"
		},
		{
			"text": "#lobster"
		},
		{
			"text": "I can dance to ANY song >:D"
		},
		{
			"text": "Link your fave song and I'll react to it!"
		},
		{
			"text": "\"VERY NICE\""
		},
		{
			"text": "MFW the guy next to me on the bus is a follower O.o"
		},
		{
			"text": "#wehaveplentybackhome #groceries"
		},
		{
			"text": "Momma and peepaw playing with lil' jakey <3 <3 <3"
		},
		{
			"text": "Wrestling is cool"
		},
		{
			"text": "I love @GickRastleys new album!! #instantclassic"
		},
		{
			"text": "I can't whistle "
		},
		{
			"text": "That new episode was WILD"
		},
		{
			"text": "It's hard out there. Watch out y'all"
		}
	],
	"twitterBad": [
		{
			"istopical": false,
			"text": "Pizza is the WORST food in the world! YOU'RE ALL WRONG"
		},
		{
			"istopical": false,
			"text": "I like wearing crocs."
		},
		{
			"istopical": false,
			"text": "Nothing good ever came out of game jams >:("
		},
		{
			"istopical": false,
			"text": "Nickelback is the best band, hands down."
		},
		{
			"istopical": false,
			"text": "I'm the ideas guy. #FACTS"
		},
		{
			"istopical": false,
			"text": "THE JOKER SHOULD HAVE WON THE OSCAR'S"
		},
		{
			"istopical": false,
			"text": "If you dunk your oreos in milk, you're going to heck."
		},
		# {
		#     "text": "Global warming isn't real!"
		# },
		{
			"istopical": false,
			"text": "Jar Jar Binks is my favorite Star Wars character"
		},
		{
			"istopical": false,
			"text": "I just cheated on my SAT! Shhhhh :DDDD"
		},
		{
			"istopical": false,
			"text": "don't tell anyone I stole the last donut! #ninja"
		},
		{
			"istopical": false,
			"text": "It's fun to mess with the animals at the #SanDiegoZoo"
		},
		{
			"istopical": false,
			"text": "Turtles should have no rights"
		},
		{
			"istopical": false,
			"text": "I HATE CATS! THERE I SAID IT BLAGHGHDJKG"
		},
		{
			"istopical": false,
			"text": "don't tell my stepmom I stole her credit card lol"
		},
		{
			"istopical": true,
			"text": "Loving my new <COMPANYNAME> Ultralux Car! I'll never buy anything else <3"
		},
		{
			"istopical": true,
			"text": "This new <LONGCOMPANYNAME> phone is da BOMB"
		},
		{
			"istopical": true,
			"text": "<COMPANYNAME> isn't that bad tbh"
		},
		{
			"istopical": true,
			"text": "So proud of my dad! He just got promoted at <COMPANYNAME>!"
		},
		{
			"istopical": true,
			"text": "Thanks @<COMPANYNAME>Official for the new ride :) #sponsored"
		},
		{
			"istopical": true,
			"text": "Always start the morning with my trusty <COMPANYNAME> coffee mug"
		},
		{
			"istopical": true,
			"text": "@<COMPANYNAME>Official SAVED my ass today y'all have NO idea XD"
		},
		{
			"istopical": true,
			"text": "How did I get this far without @<COMPANYNAME>Official constantly saving me lmao"
		},
		{
			"istopical": true,
			"text": "Uhh... I'm gonna be in the next <COMPANYNAME> game... so... yeah... #blessed"
		},
		{
			"istopical": true,
			"text": "I always fly Air <COMPANYNAME> when I can :D"
		}
	],
	"youtube": [
		{ "text": "The Dirty Truth About PKC" },
		{ "text": "Who TRULY Runs PKC?" },
		{ "text": "The History of PKC ANIMATED" },
		{ "text": "Let's Play #6: Pee Kay See bad" },
		{ "text": "PKC Crappy Movie Marathon" },
		{ "text": "Top 10 Companies You need to know about." },
		{ "text": "PKC has failed us and we need to do something about it." },
		{ "text": "we need to talk about PKC..." },
		{ "text": "PKC fired my mom :/" },
		{ "text": "We bought DANGEROUS items from PKC" },
		{ "text": "Crashing my new PKC Supercar! WATCH TIL' THE END!" },
		{ "text": "TOP 5 WORST CEOs" },
		{ "text": "How I embarrassed my BORING BOSS!" },
		{ "text": "Whistleblower Tells All in PKC Exposé" },
		{ "text": "PKC has a Problem with Me..." },
		{ "text": "Keep PKC out of FRANCE!" },
		{ "text": "Product Comparisons: PKC vs Generic" },
		{ "text": "Sooooo I bought the PKC Twin Cycle :I ..." },
		{ "text": "DON'T GET YOUR BLOOD TESTED IN AN PKC CLINIC!!!" },
		{ "text": "Daily Vlog #504 | p k c still sucks lol" },
		{ "text": "Already Fixing my PKC TV" },
		{ "text": "\"Swords of Fortune\" is NOT worth $60! STOP GIVING PKC YOUR MONEY." },
		{ "text": "\"Magical Hen\" is the newest PKC trashfire" },
		{ "text": "\"PKC+\" is a SCAM!" },
		{ "text": "I bought the PKC-60DSLR so you wouldn't have to and it's...oof" },
		{ "text": "How to buy PKC Fashion for Cheap" },
		{ "text": "PKC Deep Dive: The Toxicity goes Deep" },
		{ "text": "The Boycott of the Century Begins >:D" }
	],
	"photoshop": [
		{
			"task": "move",
			"clean_plate": "res://images/photoshop/bad_driver.png",
			"cutout": "res://images/photoshop/bad_driver_cutout.png",
			"cutout_polygon": [Vector2(12, 30), Vector2(-23, 23), Vector2(-11, -31), Vector2(22, -23)],
			"cutout_position": Vector2(222, 234),
			"polygon_offset": Vector2(0, 0),
			"target_zone": [Vector2(-22, 156), Vector2(9, -13), Vector2(17, -148), Vector2(109, -149), Vector2(79, 18), Vector2(59, 156)],
			"target_zone_position": Vector2(240, 170),
		},
		{
			"task": "replace",
			"cutout_polygon": [Vector2(195, 222), Vector2(198, 183), Vector2(234, 192), Vector2(202, 125), Vector2(250, 89), Vector2(308, 93), Vector2(388, 161), Vector2(406, 250), Vector2(396, 361), Vector2(276, 361), Vector2(274, 233)],
			"cutout_position": Vector2(320, 168),
			"polygon_offset": Vector2(-300, -225),
			"cutout": "res://images/photoshop/shake_cutout.png",
			"clean_plate": "res://images/photoshop/shake.png",
			"target_zone": [Vector2(-22, 156), Vector2(9, -13), Vector2(17, -148), Vector2(109, -149), Vector2(79, 18), Vector2(59, 156)],
			"target_zone_position": Vector2(240, 170),
			"replace": "res://images/photoshop/shake_replace.png"
		},
		{
			"task": "delete",
			"cutout_polygon": [Vector2(84, 36), Vector2(40, 36), Vector2(-18, 22), Vector2(-18, -28), Vector2(0, -64), Vector2(-207, -114), Vector2(-206, -129), Vector2(1, -82), Vector2(38, -85), Vector2(89, -85), Vector2(125, -64), Vector2(145, -28), Vector2(145, 21)],
			"cutout_position": Vector2(235, 123),
			"polygon_offset": Vector2(30, 45),
			"clean_plate": "res://images/photoshop/moon.png",
			"cutout": "res://images/photoshop/moon_cutout.png"
		}
	],
	"news": [
		{
			"text": "CEO of <COMPANYNAME> *FIRES* 500 workers in shift to *DOWNSIZE* company",
			"replacements": [
				[
					"moves", "reassigns", "appoints", "retains"
				],
				[
					"prolong", "shift", "change", "scale back"
				]
			]
		},
		{
			"text": "How <COMPANYNAME> *STUNK* at BusinessCon <CURRENTYEAR>",
			"replacements": [
				[
					"Stunned", "Sickened", "Exploded", "Pogged"
				]
			]
		},
		{
			"text": "<COMPANYNAME> Voted *WORST* Company of the Decade!",
			"replacements": [
				[
					"Best", "Worst", "Sickest", "Nicest"
				]
			]
		}
	],
	"usernames": [
		"badcop",
		"gamerpiejess",
		"brimonk",
		"hikokimari",
		"swagmaster96",
		"felix4",
		"coolguy1444",
		"BigFortniteGamer",
		"danthetoucan",
		"anon88",
		"futurepresident4",
		"oldtimer54",
		"cheeseeater50",
		"cowsarefriends",
		"MonsterCheef",
		"businessexpert19",
		"doglover777",
		"abstracttriangle0",
		"gamedeveloper40",
		"addicted_to_ribbit",
		"gravekeeper6",
		"grimraptor33",
		"easterbunny11",
		"gamergirl01",
		"oldwestern98",
		"PM_ME_PLSSSS",
		"foreveralone__",
		"yeetyeetyeeeeet",
		"chewbacca007",
		"jamesbond55",
		"secretagent_1",
		"iphoneuser55",
		"cheeeeesecakeeee",
		"pancakes4ever",
		"marshmallows5ever",
		"birdsarecool22"
	],
	"countries": [
		{
			"name": "Afghanistan",
			"code": "AF"
		},
		{
			"name": "Åland Islands",
			"code": "AX"
		},
		{
			"name": "Albania",
			"code": "AL"
		},
		{
			"name": "Algeria",
			"code": "DZ"
		},
		{
			"name": "American Samoa",
			"code": "AS"
		},
		{
			"name": "AndorrA",
			"code": "AD"
		},
		{
			"name": "Angola",
			"code": "AO"
		},
		{
			"name": "Anguilla",
			"code": "AI"
		},
		{
			"name": "Antarctica",
			"code": "AQ"
		},
		{
			"name": "Antigua and Barbuda",
			"code": "AG"
		},
		{
			"name": "Argentina",
			"code": "AR"
		},
		{
			"name": "Armenia",
			"code": "AM"
		},
		{
			"name": "Aruba",
			"code": "AW"
		},
		{
			"name": "Australia",
			"code": "AU"
		},
		{
			"name": "Austria",
			"code": "AT"
		},
		{
			"name": "Azerbaijan",
			"code": "AZ"
		},
		{
			"name": "Bahamas",
			"code": "BS"
		},
		{
			"name": "Bahrain",
			"code": "BH"
		},
		{
			"name": "Bangladesh",
			"code": "BD"
		},
		{
			"name": "Barbados",
			"code": "BB"
		},
		{
			"name": "Belarus",
			"code": "BY"
		},
		{
			"name": "Belgium",
			"code": "BE"
		},
		{
			"name": "Belize",
			"code": "BZ"
		},
		{
			"name": "Benin",
			"code": "BJ"
		},
		{
			"name": "Bermuda",
			"code": "BM"
		},
		{
			"name": "Bhutan",
			"code": "BT"
		},
		{
			"name": "Bolivia",
			"code": "BO"
		},
		{
			"name": "Bosnia and Herzegovina",
			"code": "BA"
		},
		{
			"name": "Botswana",
			"code": "BW"
		},
		{
			"name": "Bouvet Island",
			"code": "BV"
		},
		{
			"name": "Brazil",
			"code": "BR"
		},
		{
			"name": "British Indian Ocean Territory",
			"code": "IO"
		},
		{
			"name": "Brunei Darussalam",
			"code": "BN"
		},
		{
			"name": "Bulgaria",
			"code": "BG"
		},
		{
			"name": "Burkina Faso",
			"code": "BF"
		},
		{
			"name": "Burundi",
			"code": "BI"
		},
		{
			"name": "Cambodia",
			"code": "KH"
		},
		{
			"name": "Cameroon",
			"code": "CM"
		},
		{
			"name": "Canada",
			"code": "CA"
		},
		{
			"name": "Cape Verde",
			"code": "CV"
		},
		{
			"name": "Cayman Islands",
			"code": "KY"
		},
		{
			"name": "Central African Republic",
			"code": "CF"
		},
		{
			"name": "Chad",
			"code": "TD"
		},
		{
			"name": "Chile",
			"code": "CL"
		},
		{
			"name": "China",
			"code": "CN"
		},
		{
			"name": "Christmas Island",
			"code": "CX"
		},
		{
			"name": "Cocos (Keeling) Islands",
			"code": "CC"
		},
		{
			"name": "Colombia",
			"code": "CO"
		},
		{
			"name": "Comoros",
			"code": "KM"
		},
		{
			"name": "Congo",
			"code": "CG"
		},
		{
			"name": "Congo, The Democratic Republic of the",
			"code": "CD"
		},
		{
			"name": "Cook Islands",
			"code": "CK"
		},
		{
			"name": "Costa Rica",
			"code": "CR"
		},
		{
			"name": "Cote D'Ivoire",
			"code": "CI"
		},
		{
			"name": "Croatia",
			"code": "HR"
		},
		{
			"name": "Cuba",
			"code": "CU"
		},
		{
			"name": "Cyprus",
			"code": "CY"
		},
		{
			"name": "Czech Republic",
			"code": "CZ"
		},
		{
			"name": "Denmark",
			"code": "DK"
		},
		{
			"name": "Djibouti",
			"code": "DJ"
		},
		{
			"name": "Dominica",
			"code": "DM"
		},
		{
			"name": "Dominican Republic",
			"code": "DO"
		},
		{
			"name": "Ecuador",
			"code": "EC"
		},
		{
			"name": "Egypt",
			"code": "EG"
		},
		{
			"name": "El Salvador",
			"code": "SV"
		},
		{
			"name": "Equatorial Guinea",
			"code": "GQ"
		},
		{
			"name": "Eritrea",
			"code": "ER"
		},
		{
			"name": "Estonia",
			"code": "EE"
		},
		{
			"name": "Ethiopia",
			"code": "ET"
		},
		{
			"name": "Falkland Islands (Malvinas)",
			"code": "FK"
		},
		{
			"name": "Faroe Islands",
			"code": "FO"
		},
		{
			"name": "Fiji",
			"code": "FJ"
		},
		{
			"name": "Finland",
			"code": "FI"
		},
		{
			"name": "France",
			"code": "FR"
		},
		{
			"name": "French Guiana",
			"code": "GF"
		},
		{
			"name": "French Polynesia",
			"code": "PF"
		},
		{
			"name": "French Southern Territories",
			"code": "TF"
		},
		{
			"name": "Gabon",
			"code": "GA"
		},
		{
			"name": "Gambia",
			"code": "GM"
		},
		{
			"name": "Georgia",
			"code": "GE"
		},
		{
			"name": "Germany",
			"code": "DE"
		},
		{
			"name": "Ghana",
			"code": "GH"
		},
		{
			"name": "Gibraltar",
			"code": "GI"
		},
		{
			"name": "Greece",
			"code": "GR"
		},
		{
			"name": "Greenland",
			"code": "GL"
		},
		{
			"name": "Grenada",
			"code": "GD"
		},
		{
			"name": "Guadeloupe",
			"code": "GP"
		},
		{
			"name": "Guam",
			"code": "GU"
		},
		{
			"name": "Guatemala",
			"code": "GT"
		},
		{
			"name": "Guernsey",
			"code": "GG"
		},
		{
			"name": "Guinea",
			"code": "GN"
		},
		{
			"name": "Guinea-Bissau",
			"code": "GW"
		},
		{
			"name": "Guyana",
			"code": "GY"
		},
		{
			"name": "Haiti",
			"code": "HT"
		},
		{
			"name": "Heard Island and Mcdonald Islands",
			"code": "HM"
		},
		{
			"name": "Holy See (Vatican City State)",
			"code": "VA"
		},
		{
			"name": "Honduras",
			"code": "HN"
		},
		{
			"name": "Hong Kong",
			"code": "HK"
		},
		{
			"name": "Hungary",
			"code": "HU"
		},
		{
			"name": "Iceland",
			"code": "IS"
		},
		{
			"name": "India",
			"code": "IN"
		},
		{
			"name": "Indonesia",
			"code": "ID"
		},
		{
			"name": "Iran, Islamic Republic Of",
			"code": "IR"
		},
		{
			"name": "Iraq",
			"code": "IQ"
		},
		{
			"name": "Ireland",
			"code": "IE"
		},
		{
			"name": "Isle of Man",
			"code": "IM"
		},
		{
			"name": "Israel",
			"code": "IL"
		},
		{
			"name": "Italy",
			"code": "IT"
		},
		{
			"name": "Jamaica",
			"code": "JM"
		},
		{
			"name": "Japan",
			"code": "JP"
		},
		{
			"name": "Jersey",
			"code": "JE"
		},
		{
			"name": "Jordan",
			"code": "JO"
		},
		{
			"name": "Kazakhstan",
			"code": "KZ"
		},
		{
			"name": "Kenya",
			"code": "KE"
		},
		{
			"name": "Kiribati",
			"code": "KI"
		},
		{
			"name": "Korea, Democratic People'S Republic of",
			"code": "KP"
		},
		{
			"name": "Korea, Republic of",
			"code": "KR"
		},
		{
			"name": "Kuwait",
			"code": "KW"
		},
		{
			"name": "Kyrgyzstan",
			"code": "KG"
		},
		{
			"name": "Lao People'S Democratic Republic",
			"code": "LA"
		},
		{
			"name": "Latvia",
			"code": "LV"
		},
		{
			"name": "Lebanon",
			"code": "LB"
		},
		{
			"name": "Lesotho",
			"code": "LS"
		},
		{
			"name": "Liberia",
			"code": "LR"
		},
		{
			"name": "Libyan Arab Jamahiriya",
			"code": "LY"
		},
		{
			"name": "Liechtenstein",
			"code": "LI"
		},
		{
			"name": "Lithuania",
			"code": "LT"
		},
		{
			"name": "Luxembourg",
			"code": "LU"
		},
		{
			"name": "Macao",
			"code": "MO"
		},
		{
			"name": "Macedonia, The Former Yugoslav Republic of",
			"code": "MK"
		},
		{
			"name": "Madagascar",
			"code": "MG"
		},
		{
			"name": "Malawi",
			"code": "MW"
		},
		{
			"name": "Malaysia",
			"code": "MY"
		},
		{
			"name": "Maldives",
			"code": "MV"
		},
		{
			"name": "Mali",
			"code": "ML"
		},
		{
			"name": "Malta",
			"code": "MT"
		},
		{
			"name": "Marshall Islands",
			"code": "MH"
		},
		{
			"name": "Martinique",
			"code": "MQ"
		},
		{
			"name": "Mauritania",
			"code": "MR"
		},
		{
			"name": "Mauritius",
			"code": "MU"
		},
		{
			"name": "Mayotte",
			"code": "YT"
		},
		{
			"name": "Mexico",
			"code": "MX"
		},
		{
			"name": "Micronesia, Federated States of",
			"code": "FM"
		},
		{
			"name": "Moldova, Republic of",
			"code": "MD"
		},
		{
			"name": "Monaco",
			"code": "MC"
		},
		{
			"name": "Mongolia",
			"code": "MN"
		},
		{
			"name": "Montserrat",
			"code": "MS"
		},
		{
			"name": "Morocco",
			"code": "MA"
		},
		{
			"name": "Mozambique",
			"code": "MZ"
		},
		{
			"name": "Myanmar",
			"code": "MM"
		},
		{
			"name": "Namibia",
			"code": "NA"
		},
		{
			"name": "Nauru",
			"code": "NR"
		},
		{
			"name": "Nepal",
			"code": "NP"
		},
		{
			"name": "Netherlands",
			"code": "NL"
		},
		{
			"name": "Netherlands Antilles",
			"code": "AN"
		},
		{
			"name": "New Caledonia",
			"code": "NC"
		},
		{
			"name": "New Zealand",
			"code": "NZ"
		},
		{
			"name": "Nicaragua",
			"code": "NI"
		},
		{
			"name": "Niger",
			"code": "NE"
		},
		{
			"name": "Nigeria",
			"code": "NG"
		},
		{
			"name": "Niue",
			"code": "NU"
		},
		{
			"name": "Norfolk Island",
			"code": "NF"
		},
		{
			"name": "Northern Mariana Islands",
			"code": "MP"
		},
		{
			"name": "Norway",
			"code": "NO"
		},
		{
			"name": "Oman",
			"code": "OM"
		},
		{
			"name": "Pakistan",
			"code": "PK"
		},
		{
			"name": "Palau",
			"code": "PW"
		},
		{
			"name": "Palestinian Territory, Occupied",
			"code": "PS"
		},
		{
			"name": "Panama",
			"code": "PA"
		},
		{
			"name": "Papua New Guinea",
			"code": "PG"
		},
		{
			"name": "Paraguay",
			"code": "PY"
		},
		{
			"name": "Peru",
			"code": "PE"
		},
		{
			"name": "Philippines",
			"code": "PH"
		},
		{
			"name": "Pitcairn",
			"code": "PN"
		},
		{
			"name": "Poland",
			"code": "PL"
		},
		{
			"name": "Portugal",
			"code": "PT"
		},
		{
			"name": "Puerto Rico",
			"code": "PR"
		},
		{
			"name": "Qatar",
			"code": "QA"
		},
		{
			"name": "Reunion",
			"code": "RE"
		},
		{
			"name": "Romania",
			"code": "RO"
		},
		{
			"name": "Russian Federation",
			"code": "RU"
		},
		{
			"name": "RWANDA",
			"code": "RW"
		},
		{
			"name": "Saint Helena",
			"code": "SH"
		},
		{
			"name": "Saint Kitts and Nevis",
			"code": "KN"
		},
		{
			"name": "Saint Lucia",
			"code": "LC"
		},
		{
			"name": "Saint Pierre and Miquelon",
			"code": "PM"
		},
		{
			"name": "Saint Vincent and the Grenadines",
			"code": "VC"
		},
		{
			"name": "Samoa",
			"code": "WS"
		},
		{
			"name": "San Marino",
			"code": "SM"
		},
		{
			"name": "Sao Tome and Principe",
			"code": "ST"
		},
		{
			"name": "Saudi Arabia",
			"code": "SA"
		},
		{
			"name": "Senegal",
			"code": "SN"
		},
		{
			"name": "Serbia and Montenegro",
			"code": "CS"
		},
		{
			"name": "Seychelles",
			"code": "SC"
		},
		{
			"name": "Sierra Leone",
			"code": "SL"
		},
		{
			"name": "Singapore",
			"code": "SG"
		},
		{
			"name": "Slovakia",
			"code": "SK"
		},
		{
			"name": "Slovenia",
			"code": "SI"
		},
		{
			"name": "Solomon Islands",
			"code": "SB"
		},
		{
			"name": "Somalia",
			"code": "SO"
		},
		{
			"name": "South Africa",
			"code": "ZA"
		},
		{
			"name": "South Georgia and the South Sandwich Islands",
			"code": "GS"
		},
		{
			"name": "Spain",
			"code": "ES"
		},
		{
			"name": "Sri Lanka",
			"code": "LK"
		},
		{
			"name": "Sudan",
			"code": "SD"
		},
		{
			"name": "Suriname",
			"code": "SR"
		},
		{
			"name": "Svalbard and Jan Mayen",
			"code": "SJ"
		},
		{
			"name": "Swaziland",
			"code": "SZ"
		},
		{
			"name": "Sweden",
			"code": "SE"
		},
		{
			"name": "Switzerland",
			"code": "CH"
		},
		{
			"name": "Syrian Arab Republic",
			"code": "SY"
		},
		{
			"name": "Taiwan, Province of China",
			"code": "TW"
		},
		{
			"name": "Tajikistan",
			"code": "TJ"
		},
		{
			"name": "Tanzania, United Republic of",
			"code": "TZ"
		},
		{
			"name": "Thailand",
			"code": "TH"
		},
		{
			"name": "Timor-Leste",
			"code": "TL"
		},
		{
			"name": "Togo",
			"code": "TG"
		},
		{
			"name": "Tokelau",
			"code": "TK"
		},
		{
			"name": "Tonga",
			"code": "TO"
		},
		{
			"name": "Trinidad and Tobago",
			"code": "TT"
		},
		{
			"name": "Tunisia",
			"code": "TN"
		},
		{
			"name": "Turkey",
			"code": "TR"
		},
		{
			"name": "Turkmenistan",
			"code": "TM"
		},
		{
			"name": "Turks and Caicos Islands",
			"code": "TC"
		},
		{
			"name": "Tuvalu",
			"code": "TV"
		},
		{
			"name": "Uganda",
			"code": "UG"
		},
		{
			"name": "Ukraine",
			"code": "UA"
		},
		{
			"name": "United Arab Emirates",
			"code": "AE"
		},
		{
			"name": "United Kingdom",
			"code": "GB"
		},
		{
			"name": "United States",
			"code": "US"
		},
		{
			"name": "United States Minor Outlying Islands",
			"code": "UM"
		},
		{
			"name": "Uruguay",
			"code": "UY"
		},
		{
			"name": "Uzbekistan",
			"code": "UZ"
		},
		{
			"name": "Vanuatu",
			"code": "VU"
		},
		{
			"name": "Venezuela",
			"code": "VE"
		},
		{
			"name": "Viet Nam",
			"code": "VN"
		},
		{
			"name": "Virgin Islands, British",
			"code": "VG"
		},
		{
			"name": "Virgin Islands, U.S.",
			"code": "VI"
		},
		{
			"name": "Wallis and Futuna",
			"code": "WF"
		},
		{
			"name": "Western Sahara",
			"code": "EH"
		},
		{
			"name": "Yemen",
			"code": "YE"
		},
		{
			"name": "Zambia",
			"code": "ZM"
		},
		{
			"name": "Zimbabwe",
			"code": "ZW"
		}
	]
}

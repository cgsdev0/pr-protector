extends Node

var data = {
	"tweakables": {
		"starting_score": 90,
		"global_scalar": 3,
		"rewards": {
			"photoshop": {
				"good": {
					"base": 8,
					"range_lower": -0.4,
					"range_upper": 1.0
				},
				"bad": {
					"base": -7.5,
					"range_lower": -2.0,
					"range_upper": 0.99
				},
			},
			"reddit": {
				"good": {
					"base": 1.5,
					"range_lower": -0.1,
					"range_upper": 0.25
				},
				"bad": {
					"base": -4.5,
					"range_lower": -0.6,
					"range_upper": 0.6
				},
			},
			"twitter": {
				"good": {
					"base": 4.8,
					"range_lower": -0.4,
					"range_upper": 0.4
				},
				"bad": {
					"base": -6,
					"range_lower": -1.6,
					"range_upper": 1.6
				},
			},
			"youtube": {
				"good": {
					"base": 5,
					"range_lower": -0.5,
					"range_upper": 0.9,
				},
			}
		},
	},
	"levels": [
		{
			"title": "Orientation",
			"multiplier": 1,
			"start_email": "day_1_start",
			"damage_rate": 5,
			"self_correct_price": true,
			"linear_sequencer": [
				{
					"reddit": 3 
				},
				{
					"email": "twitter_tutorial"
				},
				{
					"reddit": 4
				}
			]
		},
		{
			"title": "A Change of View",
			"multiplier": 1,
			"start_email": "day_2_start",
			"damage_rate": 5,
			"self_correct_price": true,
			"linear_sequencer": [
				{
					"reddit": 3 
				},
				{
					"email": "youtube_tutorial"
				},
				{
					"reddit": 3
				},
				{
					"email": "generic_twitter",
				},
				{
					"email": "youtube_tutorial2"
				},
			]
		},
		{
			"title": "You Can Tell By the Pixels",
			"multiplier": 1,
			"start_email": "day_3_start",
			"damage_rate": 5,
			"self_correct_price": true,
			"linear_sequencer": [
				{
					"email": "photoshop_tutorial",
				},
				{
					"reddit": 2
				},
				{
					"email": "photoshop_barrels",
				},
				{
					"email": "generic_twitter",
				},
			]
		},
		{
			"title": "Death of a PR Man",
			"multiplier": 1,
			"start_email": "day_4_start",
			"damage_rate": 5,
			"reddit_sequencer": [1, 1, 1, 1, 2, 11, 11, 11, 40, 40, 40],
			"email_sequencer": [
				{
					"time": 7,
					"email": "generic_youtube"
				},
				{
					"time": 7.2,
					"email": "generic_twitter"
				},
				{
					"time": 20.8,
					"email": "photoshop_shake",
				},
				{
					"time": 48,
					"email": "generic_youtube",
				},
				{
					"time": 48.3,
					"email": "SPAM",
				},
				{ 
					"time": 54.5,
					"email":  "photoshop_hospital",
				},
				{
					"time": 54.7,
					"email": "photoshop_trip_lady",
				},
				{
					"time": 55,
					"email": "generic_twitter",
				},
			],
		},
		{
			"title": "Red Friday",
			"multiplier": 2,
			"damage_rate": 4,
			"reddit_sequencer": [3, 3, 3, 12, 18, 18, 20, 30, 31, 32, 33, 34, 35, 40, 50, 50, 50.1, 50.2, 50.3, 50.4, 50.5, 50.6, 50.7, 50.8, 55],
			"start_email": "day_5_start",
			"email_sequencer": [
				{
					"time": 7,
					"email": "ceo_youtuber",
				},
				{
					"time": 20.8,
					"email": "photoshop_moon_laser",
				},
				{
					"time": 59.8,
					"email": "photoshop_bad_driver",
				},
				{
					"time": 60,
					"email": "michael_plot_thread",
				},
			]
		},
		{
			"title": "Saturday",
			"multiplier": 1.15,
			"damage_rate": 3.5,
			"reddit_sequencer": [0,0,0,0,0,0,0,0,17,20,21.2, 21.7, 22.4, 22.5, 22.6, 65, 65.5, 70],
			"start_email": "day_6_start",
			"email_sequencer": [
				{
					"time": 7,
					"email": "michael_youtube",
				},
				{
					"time": 20,
					"email": "SPAM",
				},
				{
					"time": 21,
					"email": "SPAM",
				},
				{
					"time": 21.2,
					"email": "generic_twitter",
				},
				{
					"time": 21.5,
					"email": "SPAM",
				},
				{
					"time": 23,
					"email": "SPAM",
				},
				{
					"time": 30,
					"email": "photoshop_airstrip",
				},
				{
					"time": 59.8,
					"email": "photoshop_goose",
				},

			]
		}
	],
	"emails": {
		"day_1_start": {
			"subject": "Welcome to PKC!",
			"from": "Michael S. <michael.s@pkcbusiness.com>",
			"body": """Woo! About time!

I FINALLY got you in! Here's the gist: Our job is to protect the image of our dear PKC (GLORY TO PKC!) family! 

That means we gotta updoot company praise, downdoot company h8trs (DOWN WITH JDF), and cancel those who dare to spew anti-PKC propaganda on Clucker!

You can make a couple of mistakes here or there, but if you screw up too much, the company's share price goes down, and you and I are booted straight from the 186th floor straight to the 1st via the PKC Ex-Employment Express Gravity S.H.A.F.T.

Cheers! Michael S.
"""
		},
		"day_2_start": {
			"subject": "Nice work!!!!",
			"from": "Michael S. <michael.s@pkcbusiness.com>",
			"body": """Amazing job yesterday! You really showed those haters what's up! The higher ups are really digging all the work you put in to protect our precious family, so they've decided to give you some extra work!

That awful site \"YouView\" has been stirring a muck with a buncha people thinking they're slick making all these videos attacking and \"exposing\" us, but we'll show them! We're gonna hit 'em, report 'em, and take 'em down before anyone's the wiser! 

Have fun! Michael S.
"""
		},
		"day_3_start": {
			"subject": "=D",
			"from": "Michael S. <michael.s@pkcbusiness.com>",
			"body": """How are you so good at this!?? You're making me look bad haha!

Seeing as how you're such a master at the PR hustle, let's kick it up a notch with some PKC PhotoEdit! Don't worry! It's not that hard!

Just find the thing we gotta cut out or alter then select the appropriate option! Move it, delete it, or copy and paste it! You can do it!! (I love that movie lol)

Your fellow artist; Michael S.
"""
		},
		"day_4_start": {
			"subject": "Hello Colleague",
			"from": "MICHAEL <donotreply@PKCBusiness.com>",
			"body": """Hi friend. My name is Michael S. Our wonderful company has decided not to require my service and friendly, playful communication to further advance your skills and expand your opportunities.

See you again in the near future. Maybe not. Perhaps we will never meet again. Don't let our glorious PKC family down and work hard.

Goodbye.




Hi.
"""
		},
		"day_5_start": {
			"subject": "TO ALL: INSIDER TRADING INFO",
			"from": "Chad Peterson (CEO)",
			"body": """hi everyone,

some insider trading rumors have started going around; wanted to get ahead of this thing and let you all know that the stock price will probably be a tad volatile today

ps. to those of you who work in the pr department. i expect to see you here tomorrow morning if you want to keep your job
"""
		},
		"day_6_start": {
			"subject": "Disgruntled Ex-Employee",
			"from": "Abigail Peterson (Head of Public Relations)",
			"body": """I'm sending this email to anyone who worked with you-know-who.

He's apparently moved on to a new role at JDF, and he has already started a campaign against us online.

This traitorous behavior will not be tolerated.

If he tries to contact any of you, report it to me immediately.
"""
		},
		"michael_plot_thread": {
			"subject": "still alive",
			"use_daily_viewer": true,
			"from": "michael.s@hotmail.com",
			"body": """DON'T TRUST ANYONE AT PKC.

there's some shady s*** going on over there, and I can't believe I was so blind to it before.

don't want to take too much of your time, but as you can tell I'm not there anymore. They fired me yesterday.

Sorry in advance about how the market is going to treat you now, because I just landed a gig over at JDF. I guess that makes us enemies now?


I'll see you on the web.
Michael S.
"""
		},
		"youtube_tutorial": {
			"subject": "YouView Vlogger",
			"from": "Michael S. <michael.s@pkcbusiness.com>",
			"body": """I came across one of those video bloggers I was telling you about and figured I'd let you take care of this one.

just report the video and file a copyright claim. don't feel too bad about it, the video is riddled with lies! They should be grateful we don't sue.

Thanks, Michael S.
""",
			"link": "youview.com",
			"youtube": {
				"username": "jdf_corporate_media",
				"title": "10 reasons to support JDF over PKC",
				"captcha": "witness",
			},
		},
		"youtube_tutorial2": {
			"subject": "Another one",
			"from": "Michael S. <michael.s@pkcbusiness.com>",
			"body": """Got another one for ya. This cute animated bunny talks about how \"PKC is literally anti-America\".

I just hope my kids aren't watching this garbage.

Cheers, Michael S.
""",
			"link": "youview.com",
			"youtube": {
				"username": "RealBusinessBunny",
				"title": "How PKC is DESTROYING America",
				"captcha": "soccer",
				"tuber_index": 2,
			},
		},
		"michael_youtube": {
			"subject": "[EXTERNAL] thought you might enjoy :)",
			"from": "Michael S. <michael.s@JDFbusiness.com>",
			"body": """wanted to show you my latest creation for JDF. They're already considering me for promotion!

I hope you're not too stressed out by my work. Remember, it's just business!
""",
			"link": "youview.com/michael_s",
			"youtube": {
				"username": "michael_s",
				"title": "Ex-Employee TELLS ALL about PKC",
				"tuber_index": 3,
				"captcha": "soccer",
			},
		},
		"ceo_youtuber": {
			"subject": "hi - semi urgent",
			"from": "Chad Peterson (CEO)",
			"body": """hi can you deal with this? see attached
			
thank u


Sent from my PalmPilot 1000
""",
			"link": "youview.com",
			"youtube": true,
		},
		"photoshop_moon_laser": {
			"subject": "NASA again -_-",
			"from": "Abigail Peterson (Head of Public Relations)",
			"body": """It seems NASA has acquired more imagery of our space operations.

I trust you can handle this task. You did a good job on the last one.
""",
			"link": "space_laser.jpg",
			"photoshop_index": "moon_laser",
		},
		"twitter_tutorial": {
			"subject": "Corporate clucker tactics",
			"from": "Michael S. <michael.s@pkcbusiness.com>",
			"body": """Here's one of those users I talked about; this one managed to get the hashtag #boycottPKC trending.

I need you to go through their old post history, and [u]find some dirt on 'em[/u].

Just re-share it, and watch as the clucker hivemind takes care of the rest.

Go get 'em, Michael S.
""",
			"link": "clucker.com",
			"twitter": true,
		},
		"photoshop_tutorial": {
			"subject": "NASA problem",
			"from": "Abigail Peterson (Head of Public Relations)",
			"body": """Hello,

I come to you today with a bit of an odd request.

NASA has somehow acquired images of our top secret moon base. They're threatening to go public.

Your resumé stated that you are proficient with PKC PhotoEdit PRO.

Please [u]edit out the base[/u] from the image.

Thanks, Abigail
""",
			"link": "moon_base.jpg",
			"photoshop_index": "moon_building",
		},
		"photoshop_barrels": {
			"subject": "PhotoEdit job for you (barrels)",
			"from": "Dr. Edna K. (Env. Sci Dept.)",
			"body": """Some eco schmuck found our totally safe barrels that we put in the Louisiana swamps 7 years ago.

We need you to replace them with some cute gators or something and stop all this!
""",
			"link": "oil_spill.jpg",
			"photoshop_index": "swamp",
		},
		"photoshop_shake": {
			"subject": "URGENT INTER-GALACTIC SPACE TROUBLE",
			"from": "Zain Q. (EA to CFO)",
			"body": """Our CFO Jackson Kain recently met with the Garmaxian-Seculonulack Overlord; Xoach Jexxrey and the media DOES NOT like when we make deals with intergalactic space hive overlords without clearing it with the UN first.

So can you replace Xoach with a cute puppy? Marketing says puppies get 94% positive engagement rates. 
""",
			"link": "intergalactic_crisis.bmp",
			"photoshop_index": "shake",
		},
		"photoshop_hospital": {
			"subject": "Underwhelming Hospital Donation",
			"from": "Erik Withakay (President of Charitable Contributions)",
			"body": """
APPARENTLY hospitals are greedy nowadays! \"1,000 is absolutely nothing for a company like you guys!\". Whatever.

We need you to move a couple zeros around so that our donation clears for media.

Thanks plenty.
""",
			"link": "donation_check.jpg",
			"photoshop_index": "hospital_check",
		},
		"photoshop_trip_lady": {
			"from": "Boris X. <boris.x@pkcbusiness.com>",
			"subject": "Norris is a mad lad",
			"body": """Do you know Norris? He works up at financing as an executive, and he said it would be really funny if we took a pic of him tripping some dumb grandma (LOL). 

For the press release, though, can you make it look like she's tripping on something else?

PS. Doesn't he kinda look like Jackson Kain?
""",
			"link": "EPIC_TRIPPING_FAIL.jpg",
			"photoshop_index": "trip_lady",
		},
		"photoshop_airstrip": {
			"from": "<deactivated@pkcbusiness.com>",
			"subject": "Disappointing Food Donations",
			"body": """Apparently, JDF likes to show off any way they can, and decided to donate more than the minimum amount for the emergency relief effort from a week ago.

Teach them a lesson and make THEIR donations OURS! >:D
""",
			"link": "food_donos.jpg",
			"photoshop_index": "airstrip",
		},
		"photoshop_goose": {
			"from": "Dr. Edna K. (Env. Sci Dept.)",
			"subject": "Radioactive Geese????",
			"body": """Someone online noticed that one of their local gooses is uhh.... a bit more...colorful than the others?

			Just please do something to hide it. We can't afford this getting out right now
""",
			"link": "radioactive_gouse_sighting.psd",
			"photoshop_index": "goose",
		},
		"photoshop_bad_driver": {
			"subject": "kids these days...",
			"from": "Midge Roy <midge@pkcbusiness.com>",
			"body": """Oof. It looks like someones daughter in corporate got caught joyriding AND driving on the wrong side of the road!?

Spoiled brat probably spent too many summers over in europe.

Thankfully, you can't see who's driving in this pic, but we still need you to move the car to the right (heh) lane, so get on that for us. 
""",
			"link": "THIS_IS_AMERICA_NOT_ENGLAND.JPEG",
			"photoshop_index": "bad_driver",
		},
		"generic_twitter": {
			"subject": [
				"Outspoken clucker user",
				"Got another clucker",
				"Take care of this clucker?",
				"CLUCK ON THIS",
				"what the cluck",
				"Got another one",
				"Here:",
				"Got one.",
				"Stop. Them. Now.",
				"We're looking into this one:",
			],
			"from": [
				"<ANONYMOUS@DARKNET.WEB>",
				"Unknown User <259290@pkcbusiness.com>",
				"No Reply <noreply@pkcbusiness.com>",
				"Corporate <corporate@pkcbusiness.com>",
				"[REDACTED]",
				"Bill K. <billy@pkcbusiness.com>",
				"<nottheceo@pkcbusiness.com>",
				"<sportscarvroom@pkcbusiness.com>",
				"BIG RICHARD",
				"Quemel Zima",
				"Jackie C.",
				"<stephen.q@pkcbusiness.com>",
				"<xavier.b@pkcbusiness.com>",
				"<hamilton.s@pkcbusiness.com>",
				"Logan Herman",
				"Grungedam",
				"RidermanHero1996",
				"<joeswansong@gmail.com>",
				"<lois.gryffindor@gmail.com>",
				"<chr0makey@cgs.dev>",
				"<hello@badcop.games>",
			],
			"body": [
				"Take care of this one:",
				"This loud mouth needs to shut up",
				"Got another one for you:",
				"Here:",
				"We have another target for you.",
				"A loud mouth negative nelly who hates the proud PKC family brand",
				"They think we're playing smh. Show them what's what ;)",
				"Kill this account for us? Kthx",
				"Yo, broooooo I heard you take care of things for us yeah?? Do I just drop the link here?",
				"this person is a meanie :(",
				"Corporate needs some help with a thingie. Don't ask.",
				"Corporate needs help again.",
				"my mom is an exec and she said you had to help me destroy this guy who TOTALLY CHEATED on Modern Duty Combat 2 >:(",
				"End themmmmmmmmm AHHHHHHHHHH",
				"This person is a total a weirdo lol. Mess em up.",
				"Hola. ¿Me puedes ayudar?",
				"This ex-employee just leaked the color palette of our new game logo. Teach them a lesson:",
			],
			"twitter": true,
			"link": "clucker.com",
		},
		"SPAM": {
			"subject": [
				"to whom it may concern",
				"re: re: re: all",
				"URGENT",
				"help",
				"subject",
				" ",
			],
			"from": [
				"<julie@pkcbusiness.com>",
				"<chris@pkcbusiness.com>",
				"<chandler@pkcbusiness.com>",
				"<jeremy@pkcbusiness.com>",
				"<mary@pkcbusiness.com>",
				"<miranda@pkcbusiness.com>",
				"<candice@pkcbusiness.com>",
				"<dan@pkcbusiness.com>",
				"<trent@pkcbusiness.com>",
				"<roger@pkcbusiness.com>",
				"<wanda@pkcbusiness.com>",
			],
			"body": [
				"can anyone cover for me next tuesday? I work in B-45 with all the clones",
				"who took my lunch from the 108th floor fridge????",
				"nd tch spprt ths kybrd cn't tpe vwls",
				"haha i'm an idiot and left my computer unlocked so i'm getting trolled\n\n- anonymous prankster",
				"does anyone have the key to the 84th floor bathroom?",
				"help i'm locked in the stairwell by J-14, my keycard isn't working",
			],
		},
		"generic_youtube": {
			"subject": [
				"People ACTUALLY watch this garbage?",
				"not worth anyone's time:",
				"Coming in hot:",
				"YouViewers again...",
				"Another YouViewer",
				"another problematic YouView",
				"****** YOUVIEW",
				".......",
				"hello",
				"RE: RE: RE: RE: YouView",
				"can you look at this",
				"sharon told me to FWD this to u",
				"hi again",
				"you're my hero for dealing with this",
				"pls",
				"anti-pkc garbage",
			],
			"from": [
				"<janet.k@pkcbusiness.com>",
				"<samantha_a@pkcbusiness.com>",
				"<kev.lawson@pkcbusiness.com>",
				"<mike_themike_mikerson@pkcbusiness.com>",
				"<billykidman@pkcbusiness.com>",
				"<philip@pkcbusiness.com>",
				"Shotaro.Hidari",
				"Peter G.",
				"<joeswansong@gmail.com>",
				"<lois.gryffindor@gmail.com>",
				"<chr0makey@cgs.dev>",
				"<hello@badcop.games>",
				"<max.v@pkcbusiness.com>",
				"<dutybro445@pkcbusiness.com>",
				"<giantiron@pkcbusiness.com>",
				"<totocoyote@pkcbusiness.com>",
				"<manndersonn@pkcbusiness.com>",
				"<christian.c@pkcbusiness.com>",
				"<bwt@pkcbusiness.com>",
				"<pauline.ackerman@pkcbusiness.com>",
				"Eugine Patrick",
				"Yuki Wauman",
				"Sebastian Skeele",
			],
			"body": [
				"These people have WAYYY too much time on their hands:",
				"People ACTUALLY watch this garbage?",
				"I can't believe people sit down and watch 3 hour long videos criticizing our family.",
				"not worth anyone's time:",
				"Take care of this",
				"Coming in hot:",
				"Show them how we do things in the PKC family",
				"Shame we have to delete this one. The animations are so cute.",
				"Dang... I was a huge fan of theirs too...",
				"Time for them to unsub... FROM THE INTERNET!",
				"Welp... hope they didn't work too hard for this one... ",
				"This person is talking about really \"sensitive\" company things... That needs to be changed....",
				"We need this one done, like, yesterday. Hurry it up.",
				"This needs to be taken down ASAP:",
				# "(Chad Peterson - CEO) If you do this one quick I'll give you a pay raise.\n\nJk I won't lmao",
				"Remove this guy from website yes? Thank you pleases sir or miss sir",
				"This link is coming to you late. Do not expect any more mistakes from that person.",
				"Can you take this video down for us? Thanks in advance for helping me out with this.",
			],
			"youtube": true,
			"link": "youview.com",
		},
	},
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
	"competitorName": "JDF",
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
		{
			"image_index": 1,
			"isgood": true,
			"text": "I love my new arm! Thanks <COMPANYNAME>!"
		},
		{
			"image_index": 2,
			"isgood": true,
			"text": "The new <COMPANYNAME> restaurant is heckin fancy :3"
		},
		{
			"image_index": 3,
			"isgood": true,
			"text": "Copped the new <COMPANYNAME> Templar Kicks"
		},
		{
			"image_index": 4,
			"isgood": true,
			"text": "I saved so much with that <COMPANYNAME> coupon app! WOOOOOO"
		},
		{
			"image_index": 0,
			"isgood": true,
			"text": "I WON THE <COMPANYNAME> SPACESHIP RAFFLE HOLY CRAP LOIS!!"
		},
		{
			"image_index": 10,
			"isgood": true,
			"text": "<COMPANYNAME> reveals the future of virtual reality!"
		},
		{
			"image_index": 11,
			"isgood": true,
			"text": "God bless the <COMPANYNAME> Cinematic Universe <3"
		},
		{
			"image_index": 12,
			"isgood": true,
			"text": "My body is so ready for <COMPANYNAME> Con!"
		},
		{
			"image_index": 13,
			"isgood": true,
			"text": "Celebrating my 37th at the <COMPANYNAME> Trampoline Arena :)"
		},
		{
			"image_index": 5,
			"isgood": false,
			"text": "<COMPANYNAME> dumps <QUANTITY> million barrels of oil in the Pacific. Updoot for visibility!"
		},
		{
			"image_index": 6,
			"isgood": false,
			"text": "<COMPANYNAME> in the news again after CFO is caught stealing candy (again!)"
		},
		{
			"image_index": 7,
			"isgood": false,
			"text": "How does <COMPANYNAME> keep getting away with it??"
		},
		{
			"image_index": 35,
			"isgood": false,
			"text": "TIL that in <PASTYEAR>, <COMPANYNAME> was caught smuggling money through <COUNTRY>."
		},
		{
			"image_index": 9,
			"isgood": false,
			"text": "'<LONGCOMPANYNAME>' caught smuggling tacos during taco drought"
		},
		{
			"image_index": 35,
			"isgood": false,
			"text": "<COMPANYNAME> executive caught money laundering <CURRENCY>"
		},
		{
			"image_index": 15,
			"isgood": false,
			"text": "Why does <COMPANYNAME> keep greenlighting awful movies?? :("
		},
		{
			"image_index": 16,
			"isgood": false,
			"text": "Who even runs <LONGCOMPANYNAME> anymore? Is it just robots doing everything?"
		},
		{
			"image_index": 17,
			"isgood": false,
			"text": "The <COMPANYNAME> Game Jam was crap this year. What a joke..."
		},
		{
			"image_index": 18,
			"isgood": false,
			"text": "I've never seen so much corporate propaganda in the <COMPANYNAME> Film Fest :/"
		},
		{
			"image_index": 19,
			"isgood": false,
			"text": "<LONGCOMPANYNAME> new restaurant rated the worst restaurant of all time"
		},
		{
			"image_index": 2,
			"isgood": true,
			"text": "This is how <LONGCOMPANYNAME> treat their 10+ tenured employees:"
		},
		{
			"image_index": 21,
			"isgood": false,
			"text": "<COMPANYNAME> Exec cries during roast"
		},
		{
			"image_index": 22,
			"isgood": false,
			"text": "\"Massive\" car crash caused by \"<COMPANYNAME> CEO\" claims victim"
		},
		{
			"image_index": 23,
			"isgood": false,
			"text": "500 Passenger Flight forced to turnaround because of <LONGCOMPANYNAME> Exec"
		},
		{
			"image_index": 24,
			"isgood": false,
			"text": "There's some corny businessman at this bar playing guitar to any girl that looks at him??"
		},
		{
			"image_index": 25,
			"isgood": false,
			"text": "Why can my children buy knives from the <COMPANYNAME> online store!?"
		},
		{
			"image_index": 26,
			"isgood": false,
			"text": "How to Unsubscribe from any <COMPANYNAME> robocall!"
		},
		{
			"image_index": 27,
			"isgood": false,
			"text": "I can't access any <COMPANYNAME> website unless I turn off my adblock? Can anyone help?"
		},
		{
			"image_index": 28,
			"isgood": false,
			"text": "My brand new <COMPANYNAME> Ultralux Car exploded?? NANI??"
		},
		{
			"image_index": 29,
			"isgood": false,
			"text": "That new Ultraguy flick by <COMPANYNAME> was absolute TRASH"
		},
		{
			"image_index": 30,
			"isgood": false,
			"text": "Who's <COMPANYNAME> luxury company car is this?"
		},
		{
			"image_index": 16,
			"isgood": false,
			"text": "Uhhhh... <COMPANYNAME> is selling laser weapons to aliens?? Wut-----"
		},
		{
			"image_index": 31,
			"isgood": false,
			"text": "Is <COMPANYNAME> dropping an asteroid on Australia? Anyone seeing this??"
		},
		{
			"image_index": 32,
			"isgood": false,
			"text": "Why does this dinosaur have the \"<COMPANYNAME>\" logo on it..."
		},
		{
			"image_index": 33,
			"isgood": false,
			"text": "New archeological findings report a cave-painting that looks like the <COMPANYNAME> logo..."
		},
		{
			"image_index": 1,
			"isgood": false,
			"text": "mY <COMPANYNAME> aUgmeNNTAatioN 1ss mALfuNctioNIng. HeLLppp"
		},
		{
			"image_index": 34,
			"isgood": false,
			"text": "m <COMPANYNAME> c0MPTER 1snt WOrrrrKn. HeLLppp :("
		},
		{
			"image_index": 35,
			"isgood": false,
			"text": "<COMPANYNAME> literally stole 9.8B <CURRENCY> from <COUNTRY> and no one is talking about it??"
		},
		{
			"image_index": 18,
			"isgood": false,
			"text": "NEWS: <COMPANYNAME> Acquires Literally Every Movie + TV Studio for a Meager 5 Trillion; Denies it is a Monopoly"
		},
		{
			"image_index": 36,
			"isgood": true,
			"text": "The <COMPANYNAME> Games Direct was awesome! So many new titles announced ahhhh"
		},
		{
			"image_index": 37,
			"isgood": true,
			"text": "I love PK-Cat! He's so cute!!"
		},
		{
			"image_index": 25,
			"isgood": true,
			"text": "This <COMPANYNAME> knife is literally the sharpest knife I've ever owned. 10/10"
		},
		{
			"image_index": 29,
			"isgood": true,
			"text": "These retro <COMPANYNAME> superhero films are my JAM"
		},
		{
			"image_index": 9,
			"isgood": true,
			"text": "unpopular opinion: Del <COMPANYNAME> Bell always hits the spot"
		},
		{
			"image_index": 3,
			"isgood": false,
			"text": "<COMPANYNAME> sent me counterfeit shoes??? wtf"
		},
		{
			"image_index": 20,
			"isgood": true,
			"text": "good guy <COMPANYNAME> plants 100 trees"
		},
		{
			"image_index": 34,
			"isgood": true,
			"text": "this is why you should always buy <COMPANYNAME> parts"
		},
		{
			"image_index": 26,
			"isgood": true,
			"text": "my stupid <COMPETITORNAME> phone keeps getting spam calls"
		},
		{
			"image_index": 14,
			"isgood": false,
			"text": "<COMPANYNAME>oin is a massive flop shortly after launch"
		},
		{
			"image_index": 32,
			"isgood": true,
			"text": "HELLLA excited for Jurassic <COMPANYNAME> Park to open!!"
		},
		{
			"image_index": 17,
			"isgood": true,
			"text": "[Devlog] how I won <COMPANYNAME> Jam #23"
		},
		{
			"image_index": 0,
			"isgood": true,
			"text": "<COMPANYNAME>'s latest space launch: mission success"
		},
		{
			"image_index": 21,
			"isgood": true,
			"text": "mfw they run out of <COMPANYNAME> stuffed crust pizza on a friday"
		},
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
			"text": "@CluckerSupport i think my account got hacked??? Help"
		},
		{
			"text": "Stop what you're doing and watch this new @pewdiepie video. Now."
		},
		{
			"text": "Clucker is dead, change my mind"
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
			"text": "Wow........"
		},
		{
			"text": "I'm speechless rn...holy crap!"
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
			"text": "If you dunk your oreos in milk, you're going to hell."
		},
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
		{ "text": "The Dirty Truth About <COMPANYNAME>" },
		{ "text": "Who TRULY Runs <COMPANYNAME>?" },
		{ "text": "The History of <COMPANYNAME> ANIMATED" },
		{ "text": "Let's Play #6: Pee Kay See bad" },
		{ "text": "<COMPANYNAME> Crappy Movie Marathon" },
		{ "text": "Top 10 Companies You need to know about." },
		{ "text": "<COMPANYNAME> has failed us and we need to do something about it." },
		{ "text": "we need to talk about <COMPANYNAME>..." },
		{ "text": "<COMPANYNAME> fired my mom :/" },
		{ "text": "We bought DANGEROUS items from <COMPANYNAME>" },
		{ "text": "Crashing my new <COMPANYNAME> Supercar! WATCH TIL' THE END!" },
		{ "text": "TOP 5 WORST CEOs" },
		{ "text": "How I embarrassed my BORING BOSS!" },
		{ "text": "Whistleblower Tells All in <COMPANYNAME> Exposé" },
		{ "text": "<COMPANYNAME> has a Problem with Me..." },
		{ "text": "Keep <COMPANYNAME> out of FRANCE!" },
		{ "text": "Product Comparisons: <COMPANYNAME> vs Generic" },
		{ "text": "Sooooo I bought the <COMPANYNAME> Twin Cycle :I ..." },
		{ "text": "DON'T GET YOUR BLOOD TESTED IN AN <COMPANYNAME> CLINIC!!!" },
		{ "text": "Daily Vlog #504 | p k c still sucks lol" },
		{ "text": "Already Fixing my <COMPANYNAME> TV" },
		{ "text": "\"Swords of Fortune\" is NOT worth $60! STOP GIVING <COMPANYNAME> YOUR MONEY." },
		{ "text": "\"Magical Hen\" is the newest <COMPANYNAME> trashfire" },
		{ "text": "\"<COMPANYNAME>+\" is a SCAM!" },
		{ "text": "I bought the <COMPANYNAME>-60DSLR so you wouldn't have to and it's...oof" },
		{ "text": "How to buy <COMPANYNAME> Fashion for Cheap" },
		{ "text": "<COMPANYNAME> Deep Dive: The Toxicity goes Deep" },
		{ "text": "The Boycott of the Century Begins >:D" }
	],
	"photoshop": {
		"hospital_check": {
			"cutout_polygon": [Vector2(189.5, 224.5), Vector2(259.5, 224.5), Vector2(259.5, 242.5), Vector2(189.5, 242.5)],
			"cutout_position": Vector2(251.5, 185.5),
			"polygon_offset": Vector2(-222, -234),
			"cutout": "res://images/photoshop/check_cutout.png",
			"replace": "res://images/photoshop/check_cutout.png",
			"clean_plate": "res://images/photoshop/check.png",
			"task": "replace",
			"target_zone": [Vector2(283, 43), Vector2(283, 3), Vector2(365, 3), Vector2(366, 43)],
			"target_zone_position": Vector2(-30, 160),
			"followup_email": {
				"subject": "Yikes",
				"from": "Erik Withakay (President of Charitable Contributions)",
				"body": """I expected you to make it say $1,000,000, not... this...

whatever. thanks for trying
"""
			},
		},
		"moon_building": {
			"cutout_polygon": [Vector2(144, 187), Vector2(169, 171), Vector2(300, 171), Vector2(300, 297), Vector2(169, 297), Vector2(144, 250)],
			"cutout_position": Vector2(336, 131),
			"polygon_offset": Vector2(-222, -234),
			"cutout": "res://images/photoshop/moon_cutout2.png",
			"clean_plate": "res://images/photoshop/moon.png",
			"task": "delete"
		},
		"bad_driver": {
			"task": "move",
			"clean_plate": "res://images/photoshop/bad_driver.png",
			"cutout": "res://images/photoshop/bad_driver_cutout.png",
			"cutout_polygon": [Vector2(12, 30), Vector2(-23, 23), Vector2(-11, -31), Vector2(22, -23)],
			"cutout_position": Vector2(222, 234),
			"polygon_offset": Vector2(0, 0),
			"target_zone": [Vector2(-22, 156), Vector2(9, -13), Vector2(17, -148), Vector2(109, -149), Vector2(79, 18), Vector2(59, 156)],
			"target_zone_position": Vector2(240, 170),
			"followup_email": {
				"subject": "You made it worse...?",
				"from": "Midge Roy <midge@pkcbusiness.com>",
				"body": """Hats off. I didn't think it could be done, but you somehow made the image even worse.

Gratz.
"""
			},
		},
		"shake": {
			"task": "replace",
			"cutout_polygon": [Vector2(195, 222), Vector2(198, 183), Vector2(234, 192), Vector2(202, 125), Vector2(250, 89), Vector2(308, 93), Vector2(388, 161), Vector2(406, 250), Vector2(396, 361), Vector2(276, 361), Vector2(274, 233)],
			"cutout_position": Vector2(320, 168),
			"polygon_offset": Vector2(-300, -225),
			"cutout": "res://images/photoshop/shake_cutout.png",
			"clean_plate": "res://images/photoshop/shake.png",
			"target_zone": [Vector2(171, 164), Vector2(187, -173), Vector2(539, -182), Vector2(551, 170)],
			"target_zone_position": Vector2(-51, 165),
			"replace": "res://images/photoshop/shake_replace.png",
			"followup_email": {
				"subject": "WTF",
				"from": "Zain Q. (EA to CFO)",
				"body": """it's supposed to look like he's shaking hands with the puppy. What's so hard to understand????

I'll just do it myself, forget it.
"""
			},
		},
		"moon_laser": {
			"task": "delete",
			"cutout_polygon": [Vector2(84, 36), Vector2(40, 36), Vector2(-18, 22), Vector2(-18, -28), Vector2(0, -64), Vector2(-207, -114), Vector2(-206, -129), Vector2(1, -82), Vector2(38, -85), Vector2(89, -85), Vector2(125, -64), Vector2(145, -28), Vector2(145, 21)],
			"cutout_position": Vector2(235, 123),
			"polygon_offset": Vector2(30, 45),
			"clean_plate": "res://images/photoshop/moon.png",
			"cutout": "res://images/photoshop/moon_cutout.png"
		},
		"trip_lady": {
			"task": "move",
			"cutout_polygon": [Vector2(175, 173), Vector2(194, 153), Vector2(210, 187), Vector2(239, 154), Vector2(288, 215), Vector2(244, 250), Vector2(232, 306), Vector2(195, 322), Vector2(177, 286), Vector2(188, 218)],
			"cutout_position": Vector2(242, 204),
			"polygon_offset": Vector2(-222, -234),
			"target_zone": [Vector2(37, 105), Vector2(37, -137), Vector2(189, -138), Vector2(192, 101)],
			"target_zone_position": Vector2(252, 216),
			"clean_plate": "res://images/photoshop/trip_lady.png",
			"cutout": "res://images/photoshop/trip_lady_cutout.png",
			"followup_email": {
				"subject": "wow -_-",
				"from": "Norris <norris@pkcbusiness.com>",
				"body": """is this some kind of joke???

the press release is in an hour! not funny >:(
"""
			},
		},
		"airstrip": {
			"cutout_polygon": [Vector2(230, 225), Vector2(230, 242), Vector2(214, 242), Vector2(214, 225)],
			"cutout_position": Vector2(331, 279),
			"polygon_offset": Vector2(-222, -234),
			"cutout": "res://images/photoshop/airstrip_cutout.png",
			"clean_plate": "res://images/photoshop/airstrip.png",
			"replace": "res://images/photoshop/airstrip_replace.png",
			"task": "replace",
			"target_zone": [Vector2(57, 105), Vector2(57, 51), Vector2(-73, 64), Vector2(-74, 99), Vector2(-109, 100), Vector2(-109, 84), Vector2(-136, 83), Vector2(-136, 47), Vector2(-99, 48), Vector2(-99, 57), Vector2(-70, 58), Vector2(58, 45), Vector2(61, 1.00002), Vector2(100, -1.99998), Vector2(99, 48), Vector2(112, 46), Vector2(114, -13), Vector2(147, -14), Vector2(150, 85), Vector2(112, 86), Vector2(113, 52), Vector2(99, 52), Vector2(99, 105)],
			"target_zone_position": Vector2(252, 216)
		},
		"goose": {
			"cutout_polygon": [Vector2(208, 213), Vector2(225, 229), Vector2(245, 232), Vector2(244, 252), Vector2(214, 253), Vector2(198, 228)],
			"cutout_position": Vector2(401, 273),
			"polygon_offset": Vector2(-222, -234),
			"cutout": "res://images/photoshop/goose_cutout.png",
			"clean_plate": "res://images/photoshop/goose.png",
			"task": "move",
			"target_zone": [Vector2(107, -22), Vector2(175, -23), Vector2(179, 34), Vector2(105, 36)],
			"target_zone_position": Vector2(91, 233),
			"followup_email": {
				"subject": "I can still see it...?",
				"from": "Dr. Edna K. (Env. Sci Dept.)",
				"body": """what part of this radioactive goose is \"hidden\"?
"""
			},			
		},
		"swamp": {
			"cutout_polygon": [Vector2(174, 236), Vector2(202, 232), Vector2(217, 209), Vector2(271, 211), Vector2(275, 243), Vector2(235, 245), Vector2(179, 260), Vector2(169, 251)],
			"cutout_position": Vector2(365, 243),
			"polygon_offset": Vector2(-222, -234),
			"cutout": "res://images/photoshop/swamp_cutout.png",
			"clean_plate": "res://images/photoshop/swamp.png",
			"replace": "res://images/photoshop/swamp_replace.png",
			"task": "replace",
			"target_zone": [Vector2(72, 152), Vector2(101, -36), Vector2(265, -35), Vector2(322, -47), Vector2(397, -68), Vector2(497, -87), Vector2(495, 155)],
			"target_zone_position": Vector2(-51, 165),
			"followup_email": {
				"subject": "sigh...",
				"from": "Dr. Edna K. (Env. Sci Dept.)",
				"body": """HOW did you mess this up?

this looks totally shopped. Forget it. I'll get someone else to do it...
"""
			},
		}
	},
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
		"birdsarecool22",
		"disasterus959",
		"yesyesyesyesh",
		"cyal8ralig8r",
		"pingpongchamp0",
		"ProudDad16",
		"excited4pkc",
		"jdf_is_better",
		"i_love_jdf",
		"pkc_stan",
		"jdf_stan",
		"megamindbestmovie",
		"buzzlightyrjr"
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

extends Control


onready var events = get_node("/root/Events")
onready var ListItem = preload("res://windows/email_list_item.tscn")
onready var Photoshop = preload("res://windows/photoshop.tscn")
onready var Youtube = preload("res://windows/youtube.tscn")
onready var Twitter = preload("res://windows/twitter.tscn")

var opened_ind = 0
var first_email = true

func on_open_email(ind, email, link_used):
	opened_ind = ind
	$EmailPopover.visible = true
	$EmailPopover/From.text = "From: " + email.from
	$EmailPopover/Subject.text = email.subject
	$EmailPopover/BtnDelete.visible = !(email.has("can_delete") && email.can_delete == false) && (!email.has("link") || link_used)
	$EmailPopover/BodyContainer/Attachment.visible = email.has("link") && !link_used
	if email.has("link"):
		$EmailPopover/BodyContainer/Attachment/LinkText.text = email.link
	$EmailPopover/BodyContainer/Body.bbcode_text = email.body
	
func on_delete_email():
	$EmailPopover.visible = false
	$ScrollContainer/VBoxContainer.get_child(opened_ind).queue_free()
	# HACK
	yield(get_tree().create_timer(0.0), "timeout")
	update_title()
	
func on_email_link():
	var row = $ScrollContainer/VBoxContainer.get_child(opened_ind)
	$EmailPopover/BodyContainer/Attachment.visible = false
	$EmailPopover/BtnDelete.visible = true
	if row.email.has("photoshop_index"):
		var window = Photoshop.instance()
		window.photoshop_index = row.email.photoshop_index
		events.emit_signal("open_window", window)
	if row.email.has("youtube"):
		var youtube = Youtube.instance()
		var yt = row.email.youtube
		if typeof(yt) == TYPE_DICTIONARY:
			if yt.has("username"):
				youtube.youtube_username = yt.username
			if yt.has("image_path"):
				youtube.youtube_image_path = yt.image_path
			if yt.has("title"):
				youtube.youtube_title = yt.title
			if yt.has("tuber_index"):
				youtube.youtube_tuber_index = yt.tuber_index
			if yt.has("captcha"):
				youtube.youtube_captcha = yt.captcha
		events.emit_signal("open_window", youtube)
	if row.email.has("twitter"):
		events.emit_signal("open_window", Twitter.instance())
		
	# new
	row.link_used = true
	# row.queue_free()
	# yield(get_tree().create_timer(0.5), "timeout")
	# $EmailPopover.visible = false

func on_delayed_email(email, delay):
	yield(get_tree().create_timer(delay), "timeout")
	events.emit_signal("insert_email", email)
	
func on_insert_email(email):
	var row = ListItem.instance()
	if first_email:
		first_email = false
		email.first = true
	row.email = email
	$ScrollContainer/VBoxContainer.add_child(row)
	$ScrollContainer/VBoxContainer.move_child(row, 0)
	opened_ind += 1
	update_title()
	
func on_reset_level(_should_reset_score):
	$EmailPopover.visible = false
	for email in $ScrollContainer/VBoxContainer.get_children():
		email.queue_free()
	yield(get_tree().create_timer(0.0), "timeout")
	update_title()

func update_title():
	var count = $ScrollContainer/VBoxContainer.get_child_count()
	if count == 0:
		get_owner().title = "email"
	else:
		get_owner().title = "email ({COUNT})".format({ "COUNT": count })
	get_owner().update()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("insert_email_delayed", self, "on_delayed_email")
	events.connect("open_email", self, "on_open_email")
	events.connect("delete_email", self, "on_delete_email")
	events.connect("email_link", self, "on_email_link")
	events.connect("insert_email", self, "on_insert_email")
	events.connect("reset_level", self, "on_reset_level")
	# events.emit_signal("insert_email", {"subject": "We need to talk.", "from": "Human Resources", "body": "a\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\n", "link": "yeet.com", "youtube": 0})

func _process(delta):
	$NoNew.visible = ($ScrollContainer/VBoxContainer.get_child_count() == 0)

extends Control


onready var events = get_node("/root/Events")
onready var ListItem = preload("res://windows/email_list_item.tscn")
onready var Photoshop = preload("res://windows/photoshop.tscn")
onready var Youtube = preload("res://windows/youtube.tscn")
onready var Twitter = preload("res://windows/twitter.tscn")

var opened_ind = 0
var first_email = true

func on_open_email(ind, email):
	opened_ind = ind
	$EmailPopover.visible = true
	$EmailPopover/From.text = "From: " + email.from
	$EmailPopover/Subject.text = email.subject
	$EmailPopover/BtnDelete.visible = !email.has("link")
	$EmailPopover/BodyContainer/Attachment.visible = email.has("link")
	if email.has("link"):
		$EmailPopover/BodyContainer/Attachment/LinkText.text = email.link
	$EmailPopover/BodyContainer/Body.bbcode_text = email.body
	
func on_delete_email():
	$EmailPopover.visible = false
	$ScrollContainer/VBoxContainer.get_child(opened_ind).queue_free()
	
func on_email_link():
	var row = $ScrollContainer/VBoxContainer.get_child(opened_ind)
	$EmailPopover/BodyContainer/Attachment.visible = false
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
			if yt.has("captcha"):
				youtube.youtube_captcha = yt.captcha
		events.emit_signal("open_window", youtube)
	if row.email.has("twitter"):
		events.emit_signal("open_window", Twitter.instance())
	row.queue_free()
	yield(get_tree().create_timer(0.5), "timeout")
	$EmailPopover.visible = false

func on_insert_email(email):
	var row = ListItem.instance()
	if first_email:
		first_email = false
		email.first = true
	row.email = email
	$ScrollContainer/VBoxContainer.add_child(row)
	$ScrollContainer/VBoxContainer.move_child(row, 0)
	opened_ind += 1
	
# Called when the node enters the scene tree for the first time.
func _ready():
	events.connect("open_email", self, "on_open_email")
	events.connect("delete_email", self, "on_delete_email")
	events.connect("email_link", self, "on_email_link")
	events.connect("insert_email", self, "on_insert_email")
	# events.emit_signal("insert_email", {"subject": "We need to talk.", "from": "Human Resources", "body": "a\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\n", "link": "yeet.com", "youtube": 0})

func _process(delta):
	$NoNew.visible = ($ScrollContainer/VBoxContainer.get_child_count() == 0)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

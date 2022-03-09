extends Node

onready var data = get_node("/root/Data").data.photoshop[2]
onready var events = get_node("/root/Events")

func on_upload():
	$Uploading.visible = true

var moveScr
var delScr
var repScr

func _ready():
	Events.connect("photoshop_upload", self, "on_upload")
	# TEMP
	# return
	moveScr = preload("CutoutThenMove.gd")
	delScr = preload("CutoutThenDelete.gd")
	repScr = preload("CutoutThenReplace.gd")
	
	$Cutout/SAMPLE.queue_free()
	
	$Cutout.position = data.cutout_position
	$Cutout.texture = load(data.cutout)
	$CleanPlate.texture = load(data.clean_plate)
	$TargetZone.color = Color.transparent
	
	$Loading.visible = true
	
	var cutout = Polygon2D.new()
	cutout.color = Color.transparent
	cutout.polygon = data.cutout_polygon
	cutout.position = data.polygon_offset
	
	match data.task:
		"move":
			$TargetZone.polygon = data.target_zone
			$TargetZone.position = data.target_zone_position
			cutout.set_script(moveScr)
		"delete":
			cutout.set_script(delScr)
		"replace":
			$TargetZone.polygon = data.target_zone
			$TargetZone.position = data.target_zone_position
			cutout.set_script(repScr)
			cutout.replace_texture = data.replace
	
	$Cutout.add_child(cutout)

func _process(delta):
	if $Loading.visible:
		$Loading/ProgressBar.value += delta * 100 # TODO
		if $Loading/ProgressBar.ratio >= 1.0:
			yield(get_tree().create_timer(1.0), "timeout")
			$Loading.visible = false
	if $Uploading.visible:
		$Uploading/ProgressBar.value += delta * 70
		if $Uploading/ProgressBar.ratio >= 1.0:
			$Uploading/Label.text = "Success!"
			get_owner().setClosable(true)

extends "CutoutThenMove.gd"
	
var was_done = false
export var replace_texture: String

var preloaded_tex

func _process(_delta):
	if !was_done && is_cutout_complete():
		was_done = true
		events.emit_signal("photoshop_enable_delete")

func _ready():
	wait_for_replacement = true
	Events.connect("photoshop_delete", self, "on_delete")
	Events.connect("photoshop_paste", self, "on_paste")
	preloaded_tex = load(replace_texture)
	
func on_delete():
	get_parent().visible = false
	events.emit_signal("photoshop_enable_paste")

func on_paste():
	get_parent().texture = preloaded_tex
	var r = preloaded_tex.get_size()
	get_parent().position = Vector2(60 + floor(r.x / 2), 30 + floor(r.y / 2))
	position = Vector2(- floor(r.x / 2), - floor(r.y / 2))
	polygon = [Vector2(0, 0), Vector2(r.x, 0), r,  Vector2(0, r.y)]
	short_circuit_complete = true
	on_change_my_poly()
	get_parent().visible = true
	# todo: replace things

	wait_for_replacement = false
	update()

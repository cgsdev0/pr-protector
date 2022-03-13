extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Car = preload("res://windows/Car.tscn")

export var spread: int = 20
export var min_color: float = 0.5
export var max_color: float = 0.6
export var right: bool
export var car_scale: float = 1
export var car_speed_scale: float = 2
export var min_time: float = 1.0
export var max_time: float = 1.5

var next_tick
var curr_time = 0

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	next_tick = rng.randf_range(min_time, max_time)


func _process(delta):
	curr_time += delta
	
	if curr_time > next_tick:
		next_tick = rng.randf_range(min_time, max_time)
		curr_time = 0
		var new_car = Car.instance()
		new_car.position.y += rng.randi_range(0, spread)
		new_car.right = right
		new_car.modulate = Color.from_hsv(0, 0, rng.randf_range(min_color, max_color))
		new_car.car_speed = car_speed_scale
		new_car.scale = Vector2(car_scale, car_scale)
		add_child(new_car)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

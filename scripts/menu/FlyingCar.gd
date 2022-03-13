extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

var rng = RandomNumberGenerator.new()
var speed
var car_speed
var right

var car_stats = [
	{
		min_speed = 50,
		max_speed = 80,
		bob = 1,
	},
	{
		min_speed = 50,
		max_speed = 70,
		bob = 2,
	},
	{
		min_speed = 50,
		max_speed = 50,
		bob = 0.1,
	},
	{
		min_speed = 90,
		max_speed = 120,
		bob = 0,
	},
	{
		min_speed = 50,
		max_speed = 90,
		bob = 0.6,
	}
]

var curr_time = 0
var home_position

func _ready():
	home_position = position
	rng.randomize()
	frame = rng.randi_range(0, 4)
	speed = rng.randf_range(car_stats[frame].min_speed, car_stats[frame].max_speed)
	if !right:
		scale.x *= -1
	
func _process(delta):
	curr_time += delta
	var bob = 10 * car_stats[frame].bob * sin(curr_time * 1.5) * (scale.y / 2)
	if car_stats[frame].bob > 0:
		position.y = home_position.y + bob
	
	if right:
		position.x += delta * speed * car_speed
		if position.x > 1400:
			queue_free()
	else:
		position.x -= delta * speed * car_speed
		if position.x < -1400:
			queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

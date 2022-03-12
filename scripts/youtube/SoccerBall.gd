extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var direction = Vector2(0, -2)
var speed = 15000
var decel = 2500
var restitution = 0.7
var net_restitution = 0.1
var kicked = false
var failed = false

var win_count = 0

var start_pos = 0

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	start_pos = position
	kick_after_delay()
	
func kick_after_delay():
	direction.x = rng.randf_range(-0.7, 0.7)
	direction.y = -2
	yield(get_tree().create_timer(1.5), "timeout")
	$AnimatedSprite.play()
	speed = 15000
	kicked = true
	failed = false

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if !kicked:
		return
	move_and_slide(direction * speed * delta)
	speed = max(0, speed - decel * delta)
	if get_slide_count() > 0:
		var collision = get_slide_collision(0)
		if collision != null:
			if collision.collider.name == "Net":
				speed *= net_restitution
				failed = true
			else:
				speed *= restitution
			direction = direction.bounce(collision.normal)
	if speed == 0.0:
		$AnimatedSprite.stop()
		kicked = false
		yield(get_tree().create_timer(0.5), "timeout")
		if failed || win_count < 2:
			if !failed:
				win_count += 1
			position = start_pos
			kick_after_delay()
		else:
			print("yey")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

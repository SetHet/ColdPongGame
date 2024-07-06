extends RigidBody2D

var speed = 400
var ball
var dumpy = 30
var dumpy_min = 30
var dumpy_max = 64
var iq_timeout = 2

func _ready():
	ball = get_parent().find_child("Ball")
	randomize()


func _physics_process(delta):
	var direction = Vector2(0, GetDirection())

	lock_rotation = true
	linear_velocity = direction * speed
	#move_and_collide(direction * speed * delta)

func GetDirection():
	if abs(ball.position.y - position.y) > 30:
		if ball.position.y > position.y:
			return 1
		else: 
			return -1
	else:
		return 0

func _on_timer_timeout():
	dumpy = randi_range(dumpy_min, dumpy_max)
	$Timer.start(iq_timeout)
	print("time")

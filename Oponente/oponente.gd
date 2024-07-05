extends RigidBody2D

var speed = 400
var ball

func _ready():
	ball = get_parent().find_child("Ball")

func _physics_process(delta):
	var direction = Vector2(0, GetDirection())

	lock_rotation = true
	linear_velocity = direction * speed
	#move_and_collide(direction * speed * delta)

func GetDirection():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y:
			return 1
		else: 
			return -1
	else:
		return 0

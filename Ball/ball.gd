extends RigidBody2D

var speed = 0
var maxSpeed = 500
var minSpeed = 200
var scaleAddSpeedPerContact = 100
var frictionColliders = 0.1
var angleDeath = 0.8
var direction = Vector2.ZERO
var is_moving = false

func _ready():
	randomize()
	ResetBall()
	
func ResetBall():
	speed = minSpeed
	direction.x = [-1, 1][randi() % 2]
	
	direction.y = randf_range(-0.5, 0.5)
	is_moving = true
	
func _physics_process(delta):
	if is_moving:
		var collide = move_and_collide(direction.normalized() * speed * delta)
		if collide:
			var normal = collide.get_normal()
			var newDirection =  direction.normalized().bounce(normal).normalized()
			if sign(collide.get_collider_velocity().y) == 0:
				speed += scaleAddSpeedPerContact * 0.5
			elif sign(collide.get_collider_velocity().y) != sign(direction.y):
				speed -= scaleAddSpeedPerContact
				if speed < minSpeed: speed = minSpeed
			elif sign(collide.get_collider_velocity().y) == sign(direction.y):
				speed += scaleAddSpeedPerContact
				if speed > maxSpeed: speed = maxSpeed
			newDirection += collide.get_collider_velocity() * frictionColliders
			if abs(newDirection.normalized().y) > angleDeath:
				newDirection.y = sign(newDirection.y) * angleDeath
			direction = newDirection.normalized()
			
	

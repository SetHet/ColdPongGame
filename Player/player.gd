extends RigidBody2D

var speed = 400

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("accion_up"):
		direction.y -= 1
		
	if Input.is_action_pressed("accion_down"):
		direction.y += 1

	lock_rotation = true
	linear_velocity = direction * speed
	#move_and_collide(direction * speed * delta)

		



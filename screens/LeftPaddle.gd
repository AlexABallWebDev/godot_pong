extends KinematicBody2D

export var speed = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Paddle can move up or down.
	var velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if (velocity.length() > 0):
		velocity = velocity * speed
	move_and_slide(velocity)

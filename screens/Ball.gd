extends RigidBody2D

const INITIAL_TRANSFORM = Transform2D(0.0, Vector2(512, 300))
const INITIAL_LINEAR_VELOCITY = Vector2(-200,-200)

var is_resetting_state = true
var is_game_over = false

# Reset ball during physics step
func _integrate_forces(state):
	# Reset ball to initial state
	if is_resetting_state:
		state.transform = INITIAL_TRANSFORM
		state.linear_velocity = INITIAL_LINEAR_VELOCITY
		is_resetting_state = false
	if is_game_over:
		state.transform = INITIAL_TRANSFORM
		state.linear_velocity = Vector2()

# Called when this object collides with a body.
func _on_Ball_body_entered(body):
	print("ball entered body")
	print(body)

# Called when left goal signals that a body entered it
func _on_LeftGoal_body_entered(body):
	if (body == self):
		print("ball detected leftgoal body entered")
		print(body)
		is_resetting_state = true

# Called when right goal signals that a body entered it
func _on_RightGoal_body_entered(body):
	if (body == self):
		print("ball detected rightgoal body entered")
		print(body)
		is_resetting_state = true


func _on_HUD_game_over():
	is_game_over = true

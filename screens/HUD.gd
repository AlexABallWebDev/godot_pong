extends CanvasLayer

signal game_over

var left_score = 0
var right_score = 0

const MAX_SCORE = 10

func _on_LeftGoal_body_entered(body):
	if body.name == "Ball":
		print("HUD detected ball entered left goal")
		right_score += 1
		$RightScore.text = str(right_score)
		
		if right_score >= MAX_SCORE:
			print("Game over, right side wins")
			$MessageLabel.text = "RIGHT WINS"
			emit_signal("game_over")

func _on_RightGoal_body_entered(body):
	if body.name == "Ball":
		print("HUD detected ball entered right goal")
		left_score += 1
		$LeftScore.text = str(left_score)
		
		if left_score >= MAX_SCORE:
			print("Game over, left side wins")
			$MessageLabel.text = "LEFT WINS"
			emit_signal("game_over")

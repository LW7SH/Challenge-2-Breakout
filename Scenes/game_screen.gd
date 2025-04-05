extends Node2D

var ball = preload("res://Scenes/ball.tscn")
var ball_center = Vector2(320,640)
@export var life = 3
@export var score = 0
@export var life_label : Label
@export var score_label : Label
@export var result_label : Label
@export var result_timer : Timer

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.queue_free()
	reset_ball()
	

func reset_ball():
	var new_ball = ball.instantiate()
	life -= 1
	life_label.text = "Lives: " + str(life)
	if life == 0:
		result_label.text = "You lost"
		result_timer.start()
		return
	new_ball.position = ball_center
	add_child(new_ball)
	
func update_scoreboard(points):
	score += points
	score_label.text = "Score: " + str(score)
	
	if score == 160:
		result_label.text = "You Won!!!"
		result_timer.start()


func _on_result_timer_timeout() -> void:
	get_tree().reload_current_scene()

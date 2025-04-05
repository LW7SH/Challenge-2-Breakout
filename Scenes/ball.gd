extends RigidBody2D

var direction
@export var speed : float
var game 

func _ready():
	direction = Vector2(randf_range(-0.8, 0.8), 1)
	game = get_tree().current_scene
	

func _process(delta: float) -> void:
	var collision = move_and_collide(direction * speed)
	if collision:
		direction = direction.bounce(collision.get_normal())
		if collision.get_collider().is_in_group("bricks"):
			collision.get_collider().queue_free()
			game.update_scoreboard(10)

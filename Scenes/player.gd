extends CharacterBody2D

@export var speed : float

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("left","right")
	
	if direction != 0:
		velocity.x += direction * speed * delta
	else:
		velocity.x = 0
	
	move_and_collide(velocity)

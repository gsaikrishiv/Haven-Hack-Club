extends CharacterBody2D

func _physics_process(delta):
	var input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = Vector2(250 + input.x * 120, input.y * 250)
	move_and_slide()

	var screen = get_viewport_rect().size
	if position.x > 1250:
		position.x = -100
	position.y = clamp(position.y, 40, 400)

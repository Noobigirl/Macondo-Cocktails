extends PlayerState

## why using is_equal_approx instead of comparing it to 0 directly?

func entering(previous_state_path: String, data = {}) -> void:
	print(FALLING)
	
	player.animation_player.play("falling")
	

func physics_update(delta: float) -> void:
	var direction: float = Input.get_axis("left", "right")
	
	# allowing the player to move horizontally while falling
	player.velocity.x = player.speed * direction
	player.velocity += player.get_gravity() * delta 
	player.move_and_slide()
	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			finished.emit(IDLE)
		else:
			finished.emit(WALKING)
			
	

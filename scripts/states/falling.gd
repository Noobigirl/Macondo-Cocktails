extends PlayerState


func entering(previous_state_path: String, data = {}) -> void:
	print(FALLING)
	
	player.animation_player.play("falling")
	

func physics_update(delta: float) -> void:
	var direction: float = Input.get_axis("left", "right")
	
	# allowing the player to move horizontally while falling
	# of course, player can't move at the same speed as on ground
	player.velocity.x = player.speed * direction * player.velocity_modifier
	player.velocity += player.get_gravity() * delta * player.gravity_modifier
	player.move_and_slide()
	if player.is_on_floor():
	# using this computers aren't precise with floats
		if is_equal_approx(player.velocity.x, 0.0):
			finished.emit(IDLE)
		else:
			finished.emit(WALKING)
			
	

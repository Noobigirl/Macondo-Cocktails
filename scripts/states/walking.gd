extends PlayerState

func entering(previous_state_path: String, data = {}) -> void:
	player.animation_player.play("walking")
	
func physics_update(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	# the direction is positive if moving right and negative otherwise
	# direction < 0.0 evaluates to a bool and flips the sprte accordingly
	player.animation_player.flip_h = direction < 0.0
	player.velocity.x = direction * player.speed
	player.velocity += player.get_gravity() * delta 
	
	if Input.is_action_pressed("run"):
		finished.emit(RUNNING)
		
	elif  Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING)
		
	elif Input.is_action_just_pressed("attack"):
		finished.emit(ATTACKING)
		
	elif not player.is_on_floor():
		finished.emit(FALLING)
	
	## what if you used is_equal_approx here ?
	elif not direction: # no direction  so go back to idle
		finished.emit(IDLE)

extends PlayerState

func entering(previous_state_path: String, data = {}) -> void:
	print(WALKING)
	player.animation_player.play("walking")
	
func physics_update(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	# the direction is positive if moving right and negative otherwise
	# direction < 0.0 evaluates to a bool and flips the sprte accordingly
	player.animation_player.flip_h = direction < 0.0
	player.velocity.x = direction * player.speed
	player.velocity += player.get_gravity() * delta * player.gravity_modifier
	player.move_and_slide()
	
	if Input.is_action_pressed("run"):
		finished.emit(RUNNING)
		
	elif  Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING) 
		## 2 jumps animations: one when idle and one when moving
		
	elif Input.is_action_just_pressed("attack"):
		finished.emit(ATTACKING)
		
	elif not player.is_on_floor():
		finished.emit(FALLING)
	
	elif not direction: # no direction  so go back to idle
		finished.emit(IDLE)

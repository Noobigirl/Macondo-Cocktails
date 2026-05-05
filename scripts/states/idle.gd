extends PlayerState


func entering(previous_state_path: String, data = {}) -> void:
	print(IDLE)
	# making our player static and playing the animatin upon entering 
	# using move_toward to create smooth deceleration instead of abruptly stop the player
	# can alter the delta argument to create friction  make the player decelerate slower)
	player.velocity.x = move_toward(player.velocity.x, 0, player.speed)
	player.animation_player.play("idle")
	
func physics_update(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	# gravity is always applied wether the player is on floor or not
	# cuz you're not in space, duh.
	player.velocity += player.get_gravity() * delta * player.gravity_modifier
	player.move_and_slide() # find out what move_and_slide does under the hood
	
	if not player.is_on_floor():
		finished.emit(FALLING) # gravity applied in falling state
		
	elif Input.is_action_just_pressed("jump") :
		finished.emit(JUMPING)

	elif direction:
		finished.emit(WALKING)

	elif direction and Input.is_action_pressed("run"):
		player.velocity.y = direction * player.run_speed
		finished.emit(RUNNING)

	elif Input.is_action_just_pressed("attack"):
		finished.emit(ATTACKING)

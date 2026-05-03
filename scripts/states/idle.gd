extends PlayerState


func entering(previous_state_path: String, data = {}) -> void:
	
	# making our player static and playing the animatin upon entering 
	player.velocity.x = 0 
	player.animation_player.play("idle")
	
func physics_update(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	# applying the gravity when the player is not on the floor
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta 
		finished.emit(FALLING)
		
	elif Input.is_action_just_pressed("ui_accept") :
		finished.emit(JUMPING)
		
	elif direction:
		player.velocity.x = direction * player.speed
		finished.emit(WALKING)
	elif direction and Input.is_action_pressed("run"):
		pass
	
	## add the other states transitions
	player.move_and_slide() # find out what move_and_slide does under the hood

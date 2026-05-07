extends PlayerState


func entering(previous_state_path: String, data = {}) -> void:
	print(JUMPING)
	player.state_label.text = JUMPING
	player.animation_player.play("jumping")
	player.velocity.y = player.jump_velocity

func physics_update(delta: float) -> void:
	var direction :float= Input.get_axis("left", "right")
	
	if Input.is_action_just_released("jump"):
		player.velocity.y *= player.jump_modifier # making the player jump "smaller" if 
		# button not held while jumping

	player.velocity += player.get_gravity() * delta #* player.gravity_modifier
	# allowing the plater to move horizontally while jumping
	# player moves slower in air than on ground
	player.velocity.x = player.speed * direction * player.velocity_modifier
	#print(player.velocity.x)
	player.move_and_slide() 
	
	if player.velocity.y >= 0:
		finished.emit(FALLING)

extends PlayerState


func entering(previous_state_path: String, data = {}) -> void:
	print(RUNNING)
	player.state_label.text = RUNNING
	player.animation_player.play("running")

func physics_update(delta: float) -> void:
	var direction: float = Input.get_axis("left", "right")
	
	player.animation_player.flip_h = direction < 0.0
	player.velocity.x = direction * player.run_speed
	player.velocity += player.get_gravity() * delta * player.gravity_modifier
	player.move_and_slide()
	
	if Input.is_action_just_released("run"):
		finished.emit(WALKING)

	elif not direction :
		finished.emit(IDLE)

	elif not player.is_on_floor():
		finished.emit(FALLING)

	elif Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING)

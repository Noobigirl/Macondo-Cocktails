extends PlayerState

"""
The coyote time is a time window we give the player to jump just after entering the falling state.
It helps better the jump timing and give a fake double jump impression

The jump buffer is a time window we give the player to jump again just after landing on the ground.
The jump button might be pressed 2 or 3 frames too early before the player reaches the ground, so the buffer time
is there to help on that. 
## coyote time: just after entering falling state
## jump buffer: just before leaving falling state

Tweak coyote time and jump buffer depending on how you want the platformer to feel like
"""


var jump_buffer_timer: float 
var coyote_timer: float

func entering(previous_state_path: String, data = {}) -> void:
	print(FALLING)
	player.state_label.text = FALLING
	player.animation_player.play("falling")
	jump_buffer_timer = 0.0 # reseting the jump buffer timer upon entering the state
	coyote_timer = player.coyote_time # starting the coyote timer upon entering
	

func physics_update(delta: float) -> void:
	var direction: float = Input.get_axis("left", "right")
	
	# allowing the player to move horizontally while falling
	# of course, player can't move at the same speed as on ground
	player.velocity.x = player.speed * direction * player.velocity_modifier
	player.velocity += (player.get_gravity() * delta * player.gravity_modifier)
	player.velocity = player.velocity.clampf(player.velocity.x, player.terminal_fall_velocity)
	#print(player.velocity)
	player.move_and_slide()
	
	if player.is_on_floor():
		if jump_buffer_timer > 0.0: # if timer not finished when ground reached, jump again
			print("successful buffering")
			finished.emit(JUMPING)
		# using cuz this computers aren't precise with floats
		elif is_equal_approx(player.velocity.x, 0.0):
			finished.emit(IDLE)
		else:
			finished.emit(WALKING)

func update(_delta: float) -> void:
	# decrementing the timers at each frame
	jump_buffer_timer -= _delta 
	coyote_timer -= _delta
	
func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("jump"):
		print("jump buffer")
		jump_buffer_timer = player.jump_buffer # if the player presses jump while falling
		# we start the jump buffer timer
	if Input.is_action_just_pressed("jump") and  coyote_timer > 0.0: # if timer not finished after we just entered falling state
		print("coyote time")
		finished.emit(JUMPING) # go straight to jumping

class_name Player extends CharacterBody2D

"""
Why must the player be a class?
What's the difference between using the Input singleton vs _input(event)
vs _unhandled_input(event)
Why do we need another player states class?
What's the difference between an owner and a root node?
"""
@export var speed: float= 300.0
@export var run_speed: float = 400.0
@export var jump_velocity: float = -400.0
@onready var animation_player : AnimatedSprite2D = $AnimatedSprite2D

#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta # why is it multiplied by delta?
#
	## Handle jump.
	#
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = jump_velocity
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * speed
	#else:
		#velocity.x = move_toward(velocity.x, 0, speed)
#
	#move_and_slide()

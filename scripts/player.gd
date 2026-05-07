class_name Player extends CharacterBody2D


@export var speed: float= 75.0
@export var run_speed: float = 100.0
@export var jump_velocity: float = -350.0
@export var gravity_modifier: float = 1.2 # making the player fall a little faster
@export var velocity_modifier: float = 0.9 # making horizontal movement slower while in air
@export var jump_modifier: float = 0.5 # making the player jump at smaller height if jump button released too ealy
@export var terminal_fall_velocity: float = 300.0 # preventing player from accelerating downwards too much
@export var jump_buffer: float = 0.20 # time window for which the player can still jump while falling
@export var coyote_time: float = 0.25 # allows for delay when jumping off a ledge
@onready var animation_player : AnimatedSprite2D = $AnimatedSprite2D

@onready var state_label: Label = $Label

### attack state implementation
### smoother camera, jump and fall (feels way too rigid)
### research on platformer level design

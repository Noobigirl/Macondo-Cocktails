class_name Player extends CharacterBody2D


@export var speed: float= 75.0
@export var run_speed: float = 100.0
@export var jump_velocity: float = -350.0
@export var gravity_modifier: float = 0.5
@export var velocity_modifier: float = 0.9
@export var jump_buffer: float = 0.15 # time window for which the player can still jump while falling
@export var coyote_time: float = 0.15 # allows for delay when jumping off a lege
@onready var animation_player : AnimatedSprite2D = $AnimatedSprite2D

@onready var state_label: Label = $Label

### attack state implementation
### smoother camera, jump and fall (feels way too rigid)
### research on platformer level design

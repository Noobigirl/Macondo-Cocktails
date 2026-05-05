class_name Player extends CharacterBody2D

###make devlog on base states you added
### attack state implementation
### smoother camera, jump and fall ( feels way too right)
### research on platformer level design
@export var speed: float= 75.0
@export var run_speed: float = 100.0
@export var jump_velocity: float = -300.0
@export var gravity_modifier: float = 0.5
@export var velocity_modifier: float = 0.9
@onready var animation_player : AnimatedSprite2D = $AnimatedSprite2D

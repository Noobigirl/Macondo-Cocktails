class_name PlayerState extends State


# All the states our player can be in 
const IDLE = "Idle"
const WALKING = "Walking"
const RUNNING = "Running"
const JUMPING = "Jumping"
const FALLING = "Falling"
const HITSTUN = "Hitstun"
const ATTACKING = "Attacking"
const SPECIAL1 = "Special1"
const SPECIAL2 = "Special2"

var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await  owner.ready
	player = owner as Player 
	assert(player != null, "The PlayerState Node must be used only in the player scene.")

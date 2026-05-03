class_name StateMachine extends Node


### why do we need an initial and current state?
# initial state of the state machine:
@onready var current_state: State = get_child(0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_state.entering("")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

class_name StateMachine extends Node


# the first child of the StateMachine node is the default state
# make sure that the StateMachine always has at least one child
@onready var current_state: State = get_child(0)


func _ready() -> void:
	for state in get_children(): # implying that all children are of type State
		state.finished.connect(_transtion_to_next_state)
	
	# waiting for the root of the scene tree (in this case, our entity) to be ready to guarantee all
	# data and nodes the states might need are available
	await owner.ready
	current_state.entering("") # entering the default state so no previous state or data to pass

func _transtion_to_next_state(target_state: String, data:= {}) -> void: # passing the next state as a node path
	assert(has_node(target_state), owner.name+ " is trying to change state to "+ target_state+ " which doesn't exist in its state machine")
	
	var previous_state := current_state.name # node name = state name 
	current_state.exiting()
	current_state = get_node(target_state)
	current_state.entering(previous_state, data)

#func _unhandled_input(event: InputEvent) -> void:
	#current_state.handle_input(event)

func _process(delta: float) -> void:
	current_state.update(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)

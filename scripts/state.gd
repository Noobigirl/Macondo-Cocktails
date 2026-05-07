class_name State extends Node


### why do we need both and update and physics_update?
### what's the difference between process and physics_process?

"""
Emitted when the state finishes to transition to the next state
and passes data to the next state.
"""
signal finished(next_state_path: String, data: Dictionary)

# all of the following methods will be overriden by each state

"""
Called by the state machine when changing the active state.
It's very important to keep track of the previous state cuz some states
(like attack or hitstun in our case) just return to the previous one when ending.
We can also pass data that the new state might need.
"""
func entering(previous_state_path: String, data = {}) -> void:
	pass 

# called at the end of each frame by the state machine
func update(_delta: float) -> void:
	pass

# called by the state machine when receiving unhandled input events.
func handle_input(_event: InputEvent) -> void:
	pass

# called at the end of the physics's engine processing
func physics_update(delta: float) -> void:
	pass

# Called by the state machine before changing the state. 
func exiting() -> void:
	pass

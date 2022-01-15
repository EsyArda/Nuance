extends Node

class_name State

# warning-ignore:unused_signal
signal finished(next_state_name)

# Initialize the state. E.g. change the animation.
func enter():
	pass
	
func come_back():
	pass

# Clean up the state. Reinitialize values like a timer.
func exit():
	pass


func handle_input(_event):
	pass


func update(_delta):
	pass

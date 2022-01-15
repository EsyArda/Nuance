extends Node


class_name StateMachine

signal state_changed(current_state)

export(NodePath) var start_state : NodePath

var states_map = {}

var states_stack = []
var current_state = null
var _active = false setget set_active
var read_input = false

func _ready():
	if not start_state:
		start_state = get_child(0).get_path()
	for child in get_children():
		if child is State :
			states_map[child.name] = child
			var err = child.connect("finished", self, "_change_state")
			if err:
				printerr(err)
	initialize(start_state)


func initialize(initial_state):
	set_active(true)
	states_stack.push_front(get_node(initial_state))
	current_state = states_stack[0]
	current_state.enter()


func set_active(value):
	_active = value
	set_physics_process(value)
	read_input = value


func _unhandled_input(event):
	if read_input :
		current_state.handle_input(event)


func _physics_process(delta):
	current_state.update(delta)

func _change_state(state_name):
	var velocity = Vector2.ZERO
	if not _active:
		return
	current_state.exit()
	
	if state_name == "previous":
		states_stack.pop_front()
	else:
		states_stack.insert(0,states_map[state_name])
	
	current_state = states_stack[0]
	emit_signal("state_changed", current_state)
	if state_name != "previous":
		current_state.enter()
	else:
		current_state.come_back()

extends State

class_name Opening

func handle_input(event : InputEvent):
	if event.is_action_pressed("ui_accept"):
		emit_signal("finished","Playing")

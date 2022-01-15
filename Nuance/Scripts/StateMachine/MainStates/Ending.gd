extends State

class_name Ending

func handle_input(event : InputEvent):
	if event.is_action_pressed("ui_accept"):
		emit_signal("finished","Opening")

func enter():
	owner.get_node("GlobalUI").display_Ending()
	
func exit():
	owner.get_node("GlobalUI").hide_Ending()

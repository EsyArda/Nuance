extends PlayerMouvement

class_name StateIdle

func update(_delta):
	if get_horizontal_input() :
		emit_signal("finished" , "StateMove")

func handle_input(event : InputEvent):
	if event.is_action_pressed("JUMP"):
		emit_signal("finished" , "StateJump")
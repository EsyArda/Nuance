extends PlayerMouvement

class_name StateMove

func enter():
	if Input.is_action_pressed("JUMP"):
		emit_signal("finished" , "StateJump")

func update(_delta):
	velocity.x =get_horizontal_input() * owner.speed
	velocity.y += owner.gravity *_delta
	apply_velocity()
	if velocity == Vector2.ZERO :
		emit_signal("finished" , "StateIdle")


func handle_input(event : InputEvent):
	if event.is_action_pressed("JUMP"):
		emit_signal("finished" , "StateJump")

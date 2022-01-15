extends PlayerMouvement

class_name StateJump

func enter():
	velocity.y -= owner.jump_force

func update(_delta):
	velocity.x =get_horizontal_input() * owner.speed
	velocity.y += owner.gravity *_delta
	apply_velocity()
	if velocity.y == 0:
		emit_signal("finished","StateMove")

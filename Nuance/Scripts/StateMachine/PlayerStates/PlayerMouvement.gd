extends State

class_name PlayerMouvement

var velocity : Vector2 = Vector2(0,0)

func get_horizontal_input():
	var dirx = Input.get_action_strength("RIGHT") - Input.get_action_strength("LEFT")
	return dirx

func apply_velocity():
	var _tmp = owner.move_and_slide(Vector2.ZERO)
	var col
	for i in owner.get_slide_count():
		col = owner.get_slide_collision(i).collider
		if col.owner is Elevator:
			if col.owner.color == owner.get_node("PlayerColor").color:
				owner.died()
	velocity = owner.move_and_slide_with_snap(velocity,Vector2(0,1),Vector2(0,-1),true)
	for i in owner.get_slide_count():
		col = owner.get_slide_collision(i).collider
		if col.owner is Elevator:
			if col.owner.color == owner.get_node("PlayerColor").color:
				owner.died()
	set_flip(velocity)

func touch_wall():
	return owner.is_on_wall()

func set_flip(vel : Vector2):
	if vel.x > 0:
		owner.get_node("Face").set_flip_h(true)
	elif vel.x <0:
		owner.get_node("Face").set_flip_h(false)

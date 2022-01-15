extends State

class_name PlayerMouvement

var velocity : Vector2 = Vector2(0,0)

func get_horizontal_input():
	var dirx = Input.get_action_strength("RIGHT") - Input.get_action_strength("LEFT")
	return dirx

func apply_velocity():
	velocity = owner.move_and_slide_with_snap(velocity,Vector2(0,1),Vector2(0,-1),true)

func touch_wall():
	return owner.is_on_wall()


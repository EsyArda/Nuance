extends Node2D

class_name Cursor

signal color_pick

export (int) var cursor_speed : int  = 10

func _unhandled_input(event):
	if event is InputEventMouseButton && event.is_pressed():
		var i = get_world_2d().direct_space_state.intersect_point(event.position)
		if i.size() > 0:
			var color : Color = i[0]["collider"].get_node("Color").color
			$TestColorPick.color = color
			emit_signal("color_pick",color)
	var vect_tmp : Vector2 = Vector2.ZERO
	if event.is_action_pressed("Cursor_down"):
		vect_tmp.y = cursor_speed
	if event.is_action_pressed("Cursor_down"):
		vect_tmp.y = cursor_speed

	get_viewport().warp_mouse(get_global_mouse_position() +vect_tmp)

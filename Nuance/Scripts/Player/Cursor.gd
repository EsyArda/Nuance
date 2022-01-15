extends Node2D

class_name Cursor

signal color_pick

func _unhandled_input(event):
	if event is InputEventMouseButton && event.is_pressed():
		var i = get_world_2d().direct_space_state.intersect_point(event.position)
		if i.size() > 0:
			var color : Color = i[0]["collider"].get_node("Color").color
			$TestColorPick.color = color
			emit_signal("color_pick",color)

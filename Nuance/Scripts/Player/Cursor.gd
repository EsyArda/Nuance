extends Node2D

class_name Cursor

func _unhandled_input(event):
	if event is InputEventMouseButton && event.is_pressed():
		var image : Image = get_viewport().get_texture().get_data()
		image.flip_y()
		image.lock()
		var color : Color = image.get_pixelv(event.position)
		image.unlock()
		$TestColorPick.color = color

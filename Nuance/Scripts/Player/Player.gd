extends KinematicBody2D

export (int) var gravity : int = 1000
export (int) var speed : int =200
export (int) var jump_force : int = 500

func _on_Cursor_color_pick(color : Color):
	$PlayerColor.color = color

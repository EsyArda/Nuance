extends KinematicBody2D

class_name Player

signal is_died

export (int) var gravity : int = 1000
export (int) var speed : int =200
export (int) var jump_force : int = 500

func _on_Cursor_color_pick(color : Color):
	$PlayerColor.color = color


func _on_VisibilityNotifier2D_screen_exited():
	died()

func died():
	emit_signal("is_died")

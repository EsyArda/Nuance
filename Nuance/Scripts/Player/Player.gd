extends KinematicBody2D

class_name Player

signal is_died
var velocity = Vector2.ZERO

export (int) var gravity : int = 1000
export (int) var speed : int =200
export (int) var jump_force : int = 500


func _on_Cursor_color_pick(color : Color):
	$PlayerColor.color = color
	for child in get_tree().get_nodes_in_group("Crossable"):
		if $PlayerColor.color==child.get_node("StaticPlateforme/Color").color:
			child.get_node("StaticPlateforme/CollisionPlateforme").set_deferred("disabled",true)
		else:
			child.get_node("StaticPlateforme/CollisionPlateforme").set_deferred("disabled",false)


func _on_VisibilityNotifier2D_screen_exited():
	died()

func died():
	emit_signal("is_died")

extends KinematicBody2D

class_name Player

signal is_died
var velocity = Vector2.ZERO

export (int) var gravity : int = 1000
export (int) var speed : int =150
export (float) var jump_force : float = 500
export (float) var blue_power : float = 0.2
export (float) var green_power : float = 1.5

func _on_Cursor_color_pick(color : Color):
	exit_color()
	$PlayerColor.color = color
	enter_color()
	for child in get_tree().get_nodes_in_group("Crossable"):
		if $PlayerColor.color==child.get_node("StaticPlateforme/Color").color:
			child.get_node("StaticPlateforme/CollisionPlateforme").set_deferred("disabled",true)
		else:
			child.get_node("StaticPlateforme/CollisionPlateforme").set_deferred("disabled",false)


func _on_VisibilityNotifier2D_screen_exited():
	died()

func died():
	emit_signal("is_died")

func set_hitbox(b : bool):
	$CollisionShape2D.set_deferred("disabled",not b)

func reset_color():
	exit_color()
	$PlayerColor.color = Color.black

func exit_color():
	if $PlayerColor.color == Color(0,0,1,1):
		scale = scale / blue_power
	if $PlayerColor.color == Color(0,1,0,1):
		jump_force = jump_force / green_power

func enter_color():
	if $PlayerColor.color == Color(0,0,1,1):
		scale = blue_power * scale
	if $PlayerColor.color == Color(0,1,0,1):
		jump_force = jump_force * green_power

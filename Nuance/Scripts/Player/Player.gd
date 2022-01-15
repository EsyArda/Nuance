extends KinematicBody2D

export (int) var gravity : int = 200

var velocity : Vector2 = Vector2()

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))


func _on_Cursor_color_pick(color : Color):
	$PlayerColor.color = color

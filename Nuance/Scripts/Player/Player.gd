extends KinematicBody2D

export (int) var gravity : int = 200
export (int) var speed : int =100

var velocity : Vector2 = Vector2()

func _physics_process(delta):
	velocity.x = get_horizontal_input() * speed
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity)


func _on_Cursor_color_pick(color : Color):
	$PlayerColor.color = color

func get_horizontal_input():
	var dirx = Input.get_action_strength("RIGHT") - Input.get_action_strength("LEFT")
	return dirx

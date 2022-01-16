extends Node2D


var levels : Array = [preload("res://Scenes/Level/Level0.tscn"), preload("res://Scenes/Level/Level1.tscn"), preload("res://Scenes/Level/Level4.tscn"), preload("res://Scenes/Level/Level6.tscn")]
var current_level_index : int = -1
var node_level = null

export (int) var cursor_speed : int  = 6

func nextLevel():
	$StateMachine.current_state.next()

func respawn():
	var player = get_node("Player")
	if node_level && node_level.reset_when_died:
		reload_lvl()
	elif player:
		player.position = node_level.spawn_point

func set_spawn_point(pos):
	if $Player:
		$Player.position = pos
		$Player.reset_color()

func reload_lvl():
	$StateMachine.current_state.load_level()

func _physics_process(_delta):
	var vect_tmp : Vector2 = Vector2.ZERO
	if Input.is_action_pressed("Cursor_down"):
		vect_tmp.y = cursor_speed
	if Input.is_action_pressed("Cursor_up"):
		vect_tmp.y = -cursor_speed
	if Input.is_action_pressed("Cursor_left"):
		vect_tmp.x = -cursor_speed
	if Input.is_action_pressed("Cursor_right"):
		vect_tmp.x = cursor_speed
	if vect_tmp !=  Vector2.ZERO:
		get_viewport().warp_mouse(get_global_mouse_position() +vect_tmp)

func _unhandled_input(event : InputEvent):
	if event.is_action_pressed("SKIP"):
		nextLevel()

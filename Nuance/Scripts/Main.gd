extends Node2D


var levels : Array = [preload("res://Scenes/Level/Level0.tscn"), preload("res://Scenes/Level/Level1.tscn"), preload("res://Scenes/Level/Level4.tscn")]
var current_level_index : int = -1
var node_level = null

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

extends Node2D


var levels : Dictionary = {"1" : preload("res://Scenes/Level/Level1.tscn")}
var current_level_index : int = 0
var node_level = null

func nextLevel():
	$StateMachine.current_state.next()

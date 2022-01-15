extends Node2D


var levels : Dictionary = {"1" : preload("res://Scenes/Level/Level1.tscn")}
var current_level_index : int = 0
var node_level = null

func _ready():
	nextLevel()
	
	
func nextLevel():
	current_level_index += 1
	if(node_level):
		node_level.queue_free()
	node_level = levels[str(current_level_index)].instance()
	add_child(node_level)
	$Player.position = node_level.spawn_point
	

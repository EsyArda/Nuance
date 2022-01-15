extends State

class_name Playing

var player_node = preload("res://Scenes/Player/Player.tscn")

func enter():
	owner.current_level_index = 1
	owner.add_child(player_node.instance())
	load_level()

func next():
	owner.current_level_index += 1
	load_level()

func load_level():
	owner.node_level = owner.levels[str(owner.current_level_index)].instance()
	add_child(owner.node_level)
	owner.get_node("Player").position = owner.node_level.spawn_point

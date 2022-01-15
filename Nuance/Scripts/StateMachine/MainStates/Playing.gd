extends State

class_name Playing

var player_node = preload("res://Scenes/Player/Player.tscn")

func enter():
	owner.current_level_index = 1
	var player = player_node.instance()
	owner.add_child(player)
	player.connect("is_died",owner,"respawn")
	load_level()

func next():
	owner.current_level_index += 1
	if owner.current_level_index <= owner.levels.size():
		load_level()
	else:
		emit_signal("finished","Playing")

func load_level():
	owner.node_level = owner.levels[str(owner.current_level_index)].instance()
	owner.node_level.connect("finish",owner,"nextLevel")
	add_child(owner.node_level)
	owner.get_node("Player").position = owner.node_level.spawn_point


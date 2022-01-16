extends State

class_name Playing

var player_node = preload("res://Scenes/Player/Player.tscn")
var player

func enter():
	owner.current_level_index +=1
	player = player_node.instance()
	owner.call_deferred("add_child",player)
	player.connect("is_died",owner,"respawn")
	load_level()
	owner.get_node("GlobalUI/PlayingUI").time_start = OS.get_ticks_msec()

func next():
	owner.current_level_index += 1
	if owner.current_level_index < owner.levels.size():
		load_level()
	else:
		emit_signal("finished","Ending")

func load_level():
	if owner.node_level:
		owner.node_level.queue_free()
	owner.node_level = owner.levels[owner.current_level_index].instance()
	owner.node_level.connect("finish",owner,"nextLevel")
	owner.call_deferred("add_child",owner.node_level)
	owner.get_node("GlobalUI/PlayingUI").time_start = OS.get_ticks_msec()
	
func exit():
	owner.get_node("Player").queue_free()
	owner.node_level.queue_free()
	owner.get_node("GlobalUI/PlayingUI").end_chrono()

func handle_input(event : InputEvent):
	if event.is_action_pressed("UI_Display"):
		owner.get_node("GlobalUI/PlayingUI").visible = true
	if event.is_action_released("UI_Display"):
		owner.get_node("GlobalUI/PlayingUI").visible = false

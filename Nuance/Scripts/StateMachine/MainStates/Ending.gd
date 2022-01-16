extends State

class_name Ending

export (AudioStream) var music_theme : AudioStream

func handle_input(event : InputEvent):
	if event.is_action_pressed("ui_accept"):
		emit_signal("finished","Opening")

func enter():
	owner.get_node("GlobalUI").display_Ending()
	if music_theme:
		MusicManager.play_music(music_theme)
	
func exit():
	owner.get_node("GlobalUI").hide_Ending()

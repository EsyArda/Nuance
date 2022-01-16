extends State

class_name Opening

export (AudioStream) var music_theme : AudioStream

func enter():
	owner.get_node("GlobalUI").display_Opening()
	if music_theme:
		MusicManager.play_music(music_theme)

func exit():
	MusicManager.stop_music()
	
func next():
	pass

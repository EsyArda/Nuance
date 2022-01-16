extends State

class_name Opening

export (AudioStream) var music_theme : AudioStream

func enter():
	owner.get_node("GlobalUI").display_Opening()
	if music_theme:
		MusicManager.play_music(music_theme)
	

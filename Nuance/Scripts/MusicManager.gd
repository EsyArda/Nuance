extends AudioStreamPlayer


var current_music : AudioStream

func play_music(music_clip : AudioStream):
	current_music = music_clip
	$Music/MusicPlayer.stream = music_clip
	$Music/MusicPlayer.play()
	pass

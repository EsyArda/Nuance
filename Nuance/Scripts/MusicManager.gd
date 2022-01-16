extends AudioStreamPlayer


var current_music : AudioStream

func play_music(music_clip : AudioStream):
	current_music = music_clip
	self.stream = music_clip
	self.play()

func stop_music():
	self.stop()

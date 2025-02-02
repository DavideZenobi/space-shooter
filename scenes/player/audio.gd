extends AudioStreamPlayer2D

func play_by_event(event: Util.PlayerEvents):
	var sound_file = AudioDatabase.player[event];
	var audio_stream = load(sound_file);
	stream = audio_stream;
	set_pitch_scale(apply_random_pitch());
	play();

func apply_random_pitch() -> float:
	return randf_range(1.5, 2.5);

procedure checkNoiseSoundDuration
	

	# Get duration of curr noise
	selectObject: "Sound sil_noise"
	noise_dur = Get duration
	
	if noise_dur > total_duration

		silence_padding_duration = noise_dur - total_duration

		Create Sound from formula: "silence", 1, 0.0, silence_padding_duration, fs, "0"

		plusObject: "Sound sound_mono"
		Concatenate
		Rename... sound_ready_for_noise_mixing

	else 

		selectObject: "Sound sound_mono"
		Rename... sound_ready_for_noise_mixing

	endif


endproc



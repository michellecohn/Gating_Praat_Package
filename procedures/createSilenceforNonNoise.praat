procedure createSilenceforNonNoise
	
	# Initialize with silence
	Create Sound from formula: "silence", 1, 0.0, gating_start, fs, "0"
	Rename... onset_silence_for_noise


endproc
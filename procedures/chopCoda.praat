procedure chopCoda
	
	selectObject: curr_textgrid
	n_phone_intervals = Get number of intervals: phone_tier


	# Get the start and end time for the last segment
	start_coda = Get start time of interval... phone_tier n_phone_intervals


	selectObject: curr_sound
	Extract part: 0, start_coda, "rectangular", 1, "no"
	@amplitudeNormalize
	Save as WAV file... 'outputdir_main$'2_coda_removed/'name$'.wav

	selectObject: curr_textgrid
	Extract part: 0, start_coda, "no"
	Save as text file... 'outputdir_main$'2_coda_removed/'name$'.TextGrid


endproc



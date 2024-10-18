procedure checkStereo
	
	n_channels = Get number of channels

	if n_channels > 1 
		# Convert to mono
		Convert to mono
		Rename... target_soundfile
	
	else

		Rename... target_soundfile


	endif

	curr_sound = selected("Sound")

endproc



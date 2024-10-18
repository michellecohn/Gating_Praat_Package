procedure calculateNoiseTiming
	
	# Get total vowel duration
	selectObject: curr_textgrid
	total_dur = Get total duration


		
	start_vowel = Get start time of interval... phone_tier n_phones
	end_vowel = Get end time of interval... phone_tier n_phones

	consonant_interval = n_phones - 1
	end_onset = Get end time of interval... phone_tier consonant_interval

	# Get overall vowel duration
	vowel_duration = end_vowel - start_vowel

	# Calculate duration of the vowel that will be masked by noise
	noise_mask_duration = vowel_duration*vowel_per_gated

	#appendInfoLine: "noise mask duration: 'noise_mask_duration'"

	# Calculate what time the noise should start 
	gating_start_time_vowel = vowel_duration*vowel_gating_start_perc
	gating_start = end_onset + gating_start_time_vowel

	# Overall noise duration
	overall_noise_duration = noise_mask_duration + noise_buffer

	# Silence duration based on offset of noise gating
	final_silence_sound = vowel_duration*vowel_gating_start_perc


endproc
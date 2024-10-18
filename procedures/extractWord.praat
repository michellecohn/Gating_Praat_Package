procedure extractWord
	
	selectObject: curr_textgrid
	n_word_intervals = Get number of intervals: word_tier
		#writeInfoLine: "'n_word_intervals'"

	for iinterval to n_word_intervals

		selectObject: curr_textgrid
		curr_word$ = Get label of interval... word_tier iinterval


		####### UNCOMMEENT TO HARDCODE FOR BAD ~ BAN #####
		#if curr_word$ == "bad" or curr_word$ == "ban"

			start_interval = Get start time of interval... word_tier iinterval
			end_interval = Get end time of interval... word_tier iinterval

			selectObject: curr_sound
			Extract part: start_interval, end_interval, "rectangular", 1, "no"
			Save as WAV file... 'outputdir_main$'1_chopped_words/'name$'_'curr_word$'.wav

			selectObject: curr_textgrid
			Extract part: start_interval, end_interval, "no"
			Save as text file... 'outputdir_main$'1_chopped_words/'name$'_'curr_word$'.TextGrid

		#endif

	endfor

endproc



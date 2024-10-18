procedure extractWord_from_LIST
	
	selectObject: curr_textgrid
	n_word_intervals = Get number of intervals: 1
		#writeInfoLine: "'n_word_intervals'"

	for iinterval to n_word_intervals

		selectObject: curr_textgrid
		curr_word$ = Get label of interval... 1 iinterval
	
		if curr_word$ <> ""

			 	selectObject: "WordList word_list"
				has_word = Has word: "'curr_word$'"
				#appendInfoLine: "'curr_word$'"
				#appendInfoLine: "'has_word'"

			
				if has_word
			 		selectObject: curr_textgrid

					start_interval = Get start time of interval... word_tier iinterval
					end_interval = Get end time of interval... word_tier iinterval

					selectObject: curr_sound
					Extract part: start_interval, end_interval, "rectangular", 1, "no"
					Rename... 'name$'_'curr_word$'
					Save as WAV file... 'outputdir_main$'1_chopped_words/'name$'_'curr_word$'.wav

					selectObject: curr_textgrid
					Extract part: start_interval, end_interval, "no"
					Rename... 'name$'_'curr_word$'
					Save as text file... 'outputdir_main$'1_chopped_words/'name$'_'curr_word$'.TextGrid

				endif

		endif

	endfor

endproc



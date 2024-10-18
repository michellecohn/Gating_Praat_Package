procedure addValuesTable
	

	selectObject: "Table VowelGating"
	Set string value... table_row_counter filename 'sound$'

	Set numeric value... table_row_counter vowel_start_time 'start_vowel'
	Set numeric value... table_row_counter vowel_end_time 'end_vowel'
	Set numeric value... table_row_counter vowel_duration 'vowel_duration'
	Set numeric value... table_row_counter consonant_duration 'end_onset'

	# Add noise gating percentage info
	Set numeric value... table_row_counter percentage_gating_start 'vowel_percentage'
	Set numeric value... table_row_counter percentage_gated 'vowel_perc_gated_num'

	# Add noise gating values



	Set numeric value... table_row_counter vowel_masked_duration 'noise_mask_duration'
	Set numeric value... table_row_counter noise_onset_time 'gating_start'

	#Set numeric value... table_row_counter noise_duration_total 'overall_noise_duration'

	Set numeric value... table_row_counter noise_buffer_duration 'noise_buffer'

	Set numeric value... table_row_counter total_duration 'total_dur'



endproc



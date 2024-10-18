##################################################################################
#
# (3) Create noise
# Ramp up 5 ms
#
# 20%, 40%, 60%, 80% of the vowel duration
#
# Replace the intensity contour (following https://praat-users.yahoogroups.co.narkive.com/Aya0qMEw/applying-a-new-intensity-tier-to-a-sound-intensity-manipulation)
#
#
# 2/20/24 MC
#
##################################################################################

# Set up 

include procedures/rampNoise.Praat
include procedures/checkNoiseSoundDuration.praat
include procedures/checkStereo.praat
include procedures/calculateNoiseTiming.praat
include procedures/initializeTable.praat
include procedures/addValuesTable.praat
include procedures/createNoise.praat
include procedures/createSilenceforNonNoise.praat
include procedures/createBufferNoise.praat
include procedures/addSoundBuffer.praat
include procedures/combineOnsetandNoise.praat

form Specify parameters
    comment Input directory (including final /)
 	text inputdir /Users/michellecohn/Desktop/RESEARCH_PROJECT_FOLDERS/data/2_coda_removed/

    comment Give main directory for intermediate folders for output (including final /)
    text outputdir_main /Users/michellecohn/Desktop/RESEARCH_PROJECT_FOLDERS/data/

	comment What tier is the word on? (MFA'd; tier = 1)
	positive word_tier 1

	comment What tier is the phone on? (MFA'd; tier = 2)
	positive phone_tier 2

	comment How much to ramp up? (in seconds) 
	positive ramp_up_time 0.005

	comment Relative start (% of vowel duration)
	positive vowel_percentage 80

	comment Intensity of noise (should be 1 dB less than stim)
	positive noise_dB 69.0

	comment Duration of noise buffer (at end) in seconds
	positive noise_buffer 0.125

endform


# Vowel noise gating STARTING POINT
vowel_gating_start_perc = 'vowel_percentage'/100
vowel_perc_gated_num = 100 - 'vowel_percentage'
vowel_per_gated = 'vowel_perc_gated_num' / 100

writeInfoLine: 'vowel_gating_start_perc'
appendInfoLine: 'vowel_per_gated'



# Create intermediate folders
createFolder: "'outputdir_main$'3b_noise_mixed_relative"


Create Strings as file list... list 'inputdir$'*.wav
number_files = Get number of strings

@initializeTable

for ifile to number_files
#for ifile from 1 to 1

	select Strings list
	sound$ = Get string... ifile
	Read from file... 'inputdir$''sound$'
	#curr_sound = selected("Sound")

	@checkStereo
	
	name$ = sound$ - ".wav"

	Read from file... 'inputdir$''name$'.TextGrid
	curr_textgrid = selected("TextGrid")

	# Make sure there are at least two phones here
	n_phones = Get number of intervals... phone_tier

	if n_phones >= 2

		selectObject: curr_sound
		fs = Get sampling frequency

		@calculateNoiseTiming
	
		# Add silence to the soundfile the duration of noise buffer
		@addSoundBuffer

		@createSilenceforNonNoise
		@createNoise
		@rampNoise
		@combineOnsetandNoise


		### Combine sound + noise
		#selectObject: "Sound sound_plus_buffer"
		selectObject: 'curr_sound'
		plusObject: "Sound sil_noise"

		Combine to stereo
		Convert to mono
		Save as WAV file... 'outputdir_main$'3b_noise_mixed_relative/'sound$'_gating'vowel_percentage'.wav

		@addValuesTable
		table_row_counter = table_row_counter + 1

	else
		appendInfoLine: "'name$':Did not have at least 2 phones"
	endif

		select all
		minus Strings list
		minus Table VowelGating
		Remove
	
endfor

selectObject: "Table VowelGating"
Save as comma-separated file... 'outputdir_main$'VowelGating_'vowel_percentage'.csv

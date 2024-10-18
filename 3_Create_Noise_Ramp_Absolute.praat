##################################################################################
#
# (3) Create noise
# Ramp up 5 ms
# Replace the intensity contour (following https://praat-users.yahoogroups.co.narkive.com/Aya0qMEw/applying-a-new-intensity-tier-to-a-sound-intensity-manipulation)
#
#
# 2/20/24 MC
#
##################################################################################

# Set up 
#include procedures/chopCoda.Praat
#include procedures/amplitudeNormalize.Praat

include procedures/rampNoise.Praat

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


	comment Intensity of noise (should be 1 dB less than stim)
	positive noise_dB 69.0

endform


# Create intermediate folders
createFolder: "'outputdir_main$'3_noise_mixed_absolute"


Create Strings as file list... list 'inputdir$'*.wav
number_files = Get number of strings



for ifile to number_files
#for ifile to 1

	select Strings list
	sound$ = Get string... ifile
	Read from file... 'inputdir$''sound$'
	curr_sound = selected("Sound")
	
	name$ = sound$ - ".wav"
	fs = Get sampling frequency
	total_duration = Get total duration
	
	# Create a silence
	new_silence_duration = total_duration - ramp_up_time
	Create Sound from formula: "silence", 1, 0.0, new_silence_duration, fs, "0"

	Create Sound from formula... noise Mono 0 0.125 fs  randomGauss(0,0.1)
	Scale intensity... noise_dB
	
	@rampNoise

	selectObject: "Sound silence"
	plusObject: "Sound ramped"
	Concatenate
	Rename... sil_noise
	
	selectObject: curr_sound
	plusObject: "Sound sil_noise"
	Combine to stereo
	Convert to mono

	Save as WAV file... 'outputdir_main$'3_noise_mixed_absolute/'name$'_ramp_'ramp_up_time's.wav

	#selectObject: curr_textgrid
	#selectObject: curr_sound


endfor






##################################################################################
#
# (2) Delete the final segment and save
#
# 2/20/24 MC
#
##################################################################################

# Set up 
include procedures/chopCoda.Praat
include procedures/amplitudeNormalize.Praat


form Specify parameters
    comment Input directory (including final /)
    text inputdir /Users/michellecohn/Desktop/RESEARCH_PROJECT_FOLDERS/data/1_chopped_words/

    comment Give main directory for intermediate folders for output (including final /)
    text outputdir_main /Users/michellecohn/Desktop/RESEARCH_PROJECT_FOLDERS/data/

	comment What tier is the word on? (MFA'd; tier = 1)
	positive word_tier 1

	comment What tier is the phone on? (MFA'd; tier = 2)
	positive phone_tier 2

	comment What amplitude to normalize? 
	positive new_dB 70.0

endform


# Create intermediate folders
createFolder: "'outputdir_main$'2_coda_removed"



Create Strings as file list... list 'inputdir$'*.wav
number_files = Get number of strings


for ifile to number_files
#for ifile from 2 to 2

	select Strings list
	sound$ = Get string... ifile
	Read from file... 'inputdir$''sound$'
	curr_sound = selected("Sound")

	name$ = sound$ - ".wav"
	Read from file... 'inputdir$''name$'.TextGrid
	curr_textgrid = selected("TextGrid")

	#selectObject: curr_textgrid
	#selectObject: curr_sound

	@chopCoda

	select all
	minus Strings list
	Remove

endfor






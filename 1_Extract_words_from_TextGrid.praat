##################################################################################
#
# (1) Extract CVC/CVN stimuli from a TextGrid
#
# 2/20/24 MC
#
##################################################################################

# Set up 
include procedures/extractWord.Praat
include procedures/extractWord_from_LIST.Praat


form Specify parameters
    comment Input directory (including final /)
   	text inputdir /Users/michellecohn/Desktop/RESEARCH_PROJECT_FOLDERS/data/

    comment Give main directory for intermediate folders for output (including final /)
   	text outputdir_main /Users/michellecohn/Desktop/RESEARCH_PROJECT_FOLDERS/data/


	comment What tier is the word on? (MFA'd; tier = 1)
	positive word_tier 1

	comment Using the word_list.txt in the package?
	boolean using_word_list 1

endform



# Create intermediate folders
createFolder: "'outputdir_main$'1_chopped_words"

# Load in word_list
if using_word_list
	Read Strings from raw text file... word_list.txt
	To WordList
endif

Create Strings as file list... list 'inputdir$'*.wav
number_files = Get number of strings


for ifile to number_files
#for ifile to 1

	select Strings list
	sound$ = Get string... ifile
	Read from file... 'inputdir$''sound$'
	curr_sound = selected("Sound")

	name$ = sound$ - ".wav"
	Read from file... 'inputdir$''name$'.TextGrid
	curr_textgrid = selected("TextGrid")

	
	#selectObject: curr_textgrid
	#selectObject: curr_sound

	#writeInfoLine: 'using_word_list'
	if using_word_list
		@extractWord_from_LIST

		select all
		minus Strings list
		minus WordList word_list
		Remove

	else 
		@extractWord

		select all
		minus Strings list
		Remove

	endif


endfor






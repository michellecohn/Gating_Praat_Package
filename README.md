# Gating Praat Package
This is a Praat package for taking words from a TextGrid, removing the coda, and gating into white noise.  You will need to specify an input directory (.wav + .TextGrids) as well as an output directory. The scripts will create intermediate folders in that output directory.

Michelle Cohn (February 20, 2024)

## ** Requirements **
.wav file + .TextGrid with both the word and phone-levels annotated 
(Can specify which tier, if not 1 = word, 2 = phone as is the output for MFA)

## ** Word list **
Package includes a 'word_list.txt' file. You can change this to include only the target words you want to extract and gate into noise. Note that you can uncheck 'Use word list' which will extract all words.



## ** Order of scripts **
Intended to use in the following order: 

1_Extract_words_from_TextGrid.praat
2_Delete_Final_Consonant_and_AmpNorm.praat

## ** Decide if you want to gate noise in at an absolute time (e.g., 5ms prior to end of the vowel) **
Use: 3_Create_Noise_Ramp_Absolute.praat

## ** Or if you want to gate noise into the vowel at a particular % of the vowel (e.g., 20%) #**
Use: 3b_Create_Noise_Ramp_RelativeDuration.praat

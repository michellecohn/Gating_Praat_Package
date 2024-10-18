procedure rampNoise
	
	# Ramp up 5 ms
	To Intensity: 100, 0, "yes"

	Down to IntensityTier
	Copy... flipped
	Formula... self*-1
	plusObject: "Sound noise"
	
	Multiply... no
	Rename... flattened


	selectObject: "IntensityTier noise"

	#end time
	end_time = Get end time

	# delete all points
	Remove points between: 0.0, end_time
	Add point... 0 0
	Add point... ramp_up_time noise_dB

	plusObject: "Sound flattened"
	Multiply... no
	Rename... ramped

endproc



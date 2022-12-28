#!/bin/bash

# colorize - function to generate sed command code with ANSI color assignment

# colorize r g y b p c w
# r - red
# g - green
# y - yellow
# b - blue
# p - pink
# c - cyan
# w - white



# no input
	# black color sed command code returned
# single input
	# specified input color sed command returned
# multi input
	# random color (picked from inputs)  sed command returned 


hollywood_colorize() {
	input_palette=()

	for color in "$@"; do

		if [ "$color" = "r" ]; then
			out_cmd=$'s,.*,\e[1;91m&\e[m,'
		elif [ "$color" = "g" ]; then
			out_cmd=$'s,.*,\e[1;92m&\e[m,'
		elif [ "$color" = "y" ]; then
			out_cmd=$'s,.*,\e[1;93m&\e[m,'
		elif [ "$color" = "b" ]; then
			out_cmd=$'s,.*,\e[1;94m&\e[m,'
		elif [ "$color" = "p" ]; then
			out_cmd=$'s,.*,\e[1;95m&\e[m,'
		elif [ "$color" = "c" ]; then
			out_cmd=$'s,.*,\e[1;96m&\e[m,'
		elif [ "$color" = "w" ]; then
			out_cmd=$'s,.*,\e[1;97m&\e[m,'
		else
			out_cmd=$'s,.*,\e[1;90m&\e[m,'
		fi	

		input_palette+=($out_cmd)

	done

		palette_size=${#input_palette[@]}

		if [ $palette_size -eq 0 ]; then
			out_cmd=$'s,.*,\e[1;90m&\e[m,'
			echo $out_cmd

		elif [ $palette_size -eq 1 ]; then
			echo ${input_palette[@]:0:1}

		else	
			random_index=$(jot -r 1 0 $((${#input_palette[@]}-1)))
			echo ${input_palette[@]:$random_index:1}
		
		fi

		
		

}


#!/usr/bin/env bash

# The following comments should help you get started:
# - Bash is flexible. You may use functions or write a "raw" script.
#
# - Complex code can be made easier to read by breaking it up
#   into functions, however this is sometimes overkill in bash.
#
# - You can find links about good style and other resources
#   for Bash in './README.md'. It came with this exercise.
#
#   Example:
#   # other functions here
#   # ...
#   # ...
#
result=""
main () {
	if [[ $(expr "$1" % 3) == 0 ]] && [[ $(expr "$1" % 5) == 0 ]] && [[ $(expr "$1" % 7) == 0 ]]
		then
			result=PlingPlangPlong
			echo $result
		elif [ $(expr "$1" % 3) == 0 ] && [ $(expr "$1" % 5) == 0 ]
		then
			result=PlingPlang
			echo $result
		elif [ $(expr $1 % 3) == 0 ] && [ $(expr $1 % 7) == 0 ]
		then
			result=PlingPlong
			echo $result
		elif [ $(expr $1 % 5) == 0 ] && [ $(expr $1 % 7) == 0 ]
		then 
			result=PlangPlong
			echo $result
		elif [ $(expr $1 % 3) == 0 ]
		then 
			result=Pling
			echo $result
		elif [ $(expr $1 % 5) == 0 ]
		then
			result=Plang
			echo $result
		elif [ $(expr $1 % 7) == 0 ]
		then
			result=Plong
			echo $result
		else
			result=$1
		echo $result
	fi
	
}
#
#   # call main with all of the positional arguments
main "$@"
#
# *** PLEASE REMOVE THESE COMMENTS BEFORE SUBMITTING YOUR SOLUTION ***

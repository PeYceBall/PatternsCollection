#!/bin/bash
score=$(find -name '*.py' | xargs pylint | tail -n 2 | head -n 1 | awk '{print $7}' | awk -F/ '{print $1}' | xargs)
if (($(echo $score | awk -F. '{print $1}') < 9))
then
	echo "Your pylint score is $score which is below the threshold of 9, commit is aborted"
	exit 1
fi 
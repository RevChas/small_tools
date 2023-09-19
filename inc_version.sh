#!/bin/bash

# Increments a version number
# $1: version itself
# $2: number of part: 0 – major, 1 – minor, 2 – patch
# If no second argument, increments the least significant version element (patch/build)
# Limitation: only built to work on version numbers without a trailing tag
increment_version() {
	local delimiter=.
	local array=($(echo "${1}" | tr $delimiter '\n'))
	if [ $# -eq 1 ] ; then
		whichNum=${#array[*]}
	else
		whichNum=${2}
	fi
	array[${whichNum}]=$((array[${whichNum}]+1))
	arraylen=${#array[*]}
	let index=1+${whichNum}
	while [ ${index} -lt ${arraylen} ] ; do
		array[${index}]=0
		let index=1+${index}
	done

	echo $(local IFS=. ; echo "${array[*]}")
}

increment_version ${1} ${2}


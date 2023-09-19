#!/bin/bash

# Increments a version number
# $1: version itself
# $2: number of part: 0 – major, 1 – minor, 2 – patch
# If no second argument, increments the least significant version element (patch/build)
# Limitation: only built to work on version numbers without a trailing tag
increment_version() {
	local array=($(echo "${1}" | tr . '\n'))
	if [ $# -eq 1 ] ; then
		let whichNum=${#array[*]}-1
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


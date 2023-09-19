#!/bin/bash

# Increments a version number
# $1: version itself
# $2: number of part: 0 – major, 1 – minor, 2 – patch
# Limitation: only built to work on version numbers without a trailing tag
increment_version() {
  local delimiter=.
  local array=($(echo "${1}" | tr $delimiter '\n'))
  array[${2}]=$((array[${2}]+1))
  arraylen=${#array[*]}
  let index=1+${2}
  while [ ${index} -lt ${arraylen} ] ; do
          array[${index}]=0
          let index=1+${index}
  done

  echo $(local IFS=. ; echo "${array[*]}")
}

increment_version ${1} ${2}


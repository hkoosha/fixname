#!/usr/bin/env bash
set -euo pipefail

readonly my_cmd='_fixname.sh'

readonly skip_e='::::::>>skip e<<::::::'
readonly skip_f='::::::>>skip f<<::::::'

readonly text="$*"

MY_FIXED="$("$my_cmd" "$text")"
readonly MY_FIXED

function my_debug() {
  if [[ -z ${MY_QUITE+x} ]]
  then
    echo "$*" >&2
  fi
}

if [[ "${text}" == "$MY_FIXED" ]]
then
  my_debug "${skip_f} ${text}"

elif [[ -f "$MY_FIXED" ]]
then
  my_debug "${skip_e} ${text} <=> $MY_FIXED"

else
  my_debug "${text} => $MY_FIXED"

  # Workaround for stupid case insensitive file systems
  i=0
  tmp="${text}.$i"
  while [[ -e "$tmp" ]]
  do
    i=$((i+1))
    tmp="${text}.$i"
    if [[ "$i" -eq 999 ]]
    then
      my_debug 'all tmp destinations already exist'
      exit 1
    fi
  done

  \mv -n "${text}" "${tmp}"
  \mv -n "${tmp}" "$MY_FIXED"
fi


#!/bin/bash

set -u

BASE_URL="http://translations.batocera.org"

# Updates every locale listed by the translation server for one project.
#
# Arguments:
#   $1  translation type queried from the server (options, bcc, ...)
#   $2  .po file name, without extension
#   $3  directory containing one sub-directory per locale
update_translations() {
	local type=$1
	local po_name=$2
	local locale_dir=$3
	local list_file
	local L
	local target

	list_file=$(mktemp) || return 1
	if ! wget -q "${BASE_URL}/?q=updatable&type=${type}" -O "${list_file}"
	then
		echo "unable to list updatable ${type} translations" >&2
		rm -f "${list_file}"
		return 1
	fi

	while read -r L
	do
		[ -n "${L}" ] || continue
		echo -n "updating ${L}..." >&2

		if ! test -d "${locale_dir}/${L}"
		then
			echo "directory ${locale_dir}/${L} doesn't exist" >&2
			rm -f "${list_file}"
			return 1
		fi

		target="${locale_dir}/${L}/${po_name}.po"
		if ! wget -q "${BASE_URL}/po/${po_name}_${L}.po" -O "${target}"
		then
			echo "unable to find file on translations.batocera.org" >&2
			rm -f "${list_file}"
			return 1
		fi
		printf "\t" >&2
		dos2unix "${target}" 2>/dev/null
		msgfmt --statistics "${target}"
	done < "${list_file}"

	rm -f "${list_file}"
}

# options
update_translations options options \
	package/batocera/emulationstation/batocera-es-system/locales ||
	{ echo "failed" >&2; exit 1; }

# bcc
update_translations bcc controlcenter \
	package/batocera/core/batocera-controlcenter/locales ||
	{ echo "failed" >&2; exit 1; }

exit 0

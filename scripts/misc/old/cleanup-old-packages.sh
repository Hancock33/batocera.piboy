#!/bin/bash
#
# cleanup-old-packages.sh
#
# Reclaims disk space by removing the oldest copy of package build trees (or
# download archives) when several versions of the same package are present.
#
# Usage:
#   cleanup-old-packages.sh <build-directory>...
#   cleanup-old-packages.sh --downloads <download-directory>
#
set -u

usage() {
	echo "Usage: ${0##*/} <build-directory>..." >&2
	echo "       ${0##*/} --downloads <download-directory>" >&2
}

# Prints and removes the oldest entry of every duplicated package.
#
# Arguments:
#   $1  directory to inspect
#   $2  ERE matching the version suffix (without the leading '-')
#   ... extra arguments passed to find
remove_old_entries() {
	local root=$1
	local version_regex=$2
	shift 2

	local -a stale=()
	local entry
	local path

	while IFS= read -r entry; do
		path=${entry#* }        # drop the mtime column
		stale+=("${path% *}")   # drop the basename column
	done < <(
		find "${root}" "$@" -printf '%T@ %p %f\n' 2>/dev/null |
			sed -E "s/-${version_regex}\$//" |
			sort -k3 -k1 |
			uniq -f 2 -d
	)

	if [ ${#stale[@]} -eq 0 ]; then
		return 0
	fi

	printf '  removing %s\n' "${stale[@]}"
	rm -rf -- "${stale[@]}"
}

if [ $# -eq 0 ]; then
	usage
	exit 1
fi

if [ "$1" = "--downloads" ]; then
	if [ $# -ne 2 ]; then
		usage
		exit 1
	fi
	remove_old_entries "$2" '[-_0-9a-fvrgit.]+(\.zip|\.tar\.[2a-z]+)' \
		-maxdepth 2 -type f \( -name '*.zip' -o -name '*.tar.*' \)
	exit
fi

for build_dir in "$@"; do
	echo "Cleaning: ${build_dir}"
	remove_old_entries "${build_dir}" '[0-9a-f.]+' \
		-mindepth 1 -maxdepth 1 -type d
done

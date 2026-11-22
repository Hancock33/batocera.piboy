#!/usr/bin/env bash
#
# Populate xemu meson subprojects from their .wrap files.
#
# Usage: fetch-subprojects.sh <source-dir> <cache-dir> <wrap-name>...
#
# Revisions, URLs and hashes are read from <source-dir>/subprojects/<name>.wrap,
# so each xemu fork gets exactly the versions it pins. Archives are cached in
# <cache-dir> and reused on rebuilds.

set -euo pipefail

if [ $# -lt 3 ]; then
	echo "usage: $0 <source-dir> <cache-dir> <wrap-name>..." >&2
	exit 1
fi

SRC_DIR=$1
CACHE_DIR=$2
shift 2

SUBPROJECTS_DIR="${SRC_DIR}/subprojects"
mkdir -p "${CACHE_DIR}"

# wrap_get <wrap-file> <key>: print the value of the first "key = value" line
wrap_get() {
	sed -n "s/^[[:space:]]*$2[[:space:]]*=[[:space:]]*//p" "$1" | head -n 1 | tr -d '\r'
}

# fetch <output> <url>...: download into the cache, trying each url in turn
fetch() {
	local out=$1 url
	shift
	[ -s "${out}" ] && return 0
	for url in "$@"; do
		[ -n "${url}" ] || continue
		echo ">>> xemu subprojects: downloading ${url}"
		if curl -fsSL --retry 3 --connect-timeout 30 -o "${out}.tmp" "${url}"; then
			mv "${out}.tmp" "${out}"
			return 0
		fi
	done
	rm -f "${out}.tmp"
	echo "ERROR: unable to download ${out##*/}" >&2
	return 1
}

# check_hash <file> <sha256>: verify a download, dropping it from the cache on mismatch
check_hash() {
	[ -n "$2" ] || return 0
	if ! echo "$2  $1" | sha256sum -c --status; then
		echo "ERROR: sha256 mismatch for ${1##*/}" >&2
		rm -f "$1"
		return 1
	fi
}

# extract <archive> <dest-dir>
extract() {
	rm -rf "$2"
	mkdir -p "$2"
	tar -xzf "$1" --strip-components=1 -C "$2"
}

# apply meson's patch_directory overlay, if any
apply_packagefiles() {
	local wrap=$1 dest=$2 patch_dir
	patch_dir=$(wrap_get "${wrap}" patch_directory)
	if [ -n "${patch_dir}" ]; then
		cp -a "${SUBPROJECTS_DIR}/packagefiles/${patch_dir}/." "${dest}/"
	fi
}

fetch_git_wrap() {
	local name=$1 wrap=$2 url rev dir archive_url archive
	url=$(wrap_get "${wrap}" url)
	rev=$(wrap_get "${wrap}" revision)
	dir=$(wrap_get "${wrap}" directory)
	dir=${dir:-${name}}
	url=${url%.git}

	case "${url}" in
	https://github.com/*)
		archive_url="${url}/archive/${rev}.tar.gz"
		;;
	https://gitlab.com/*)
		archive_url="${url}/-/archive/${rev}/${url##*/}-${rev}.tar.gz"
		;;
	*)
		echo "ERROR: ${name}: unsupported wrap-git host: ${url}" >&2
		return 1
		;;
	esac

	archive="${CACHE_DIR}/${name}-${rev}.tar.gz"
	fetch "${archive}" "${archive_url}"
	extract "${archive}" "${SUBPROJECTS_DIR}/${dir}"
	apply_packagefiles "${wrap}" "${SUBPROJECTS_DIR}/${dir}"
}

fetch_file_wrap() {
	local name=$1 wrap=$2 dir source patch
	dir=$(wrap_get "${wrap}" directory)
	dir=${dir:-${name}}

	source="${CACHE_DIR}/$(wrap_get "${wrap}" source_filename)"
	fetch "${source}" "$(wrap_get "${wrap}" source_url)" "$(wrap_get "${wrap}" source_fallback_url)"
	check_hash "${source}" "$(wrap_get "${wrap}" source_hash)"
	extract "${source}" "${SUBPROJECTS_DIR}/${dir}"

	if [ -n "$(wrap_get "${wrap}" patch_url)" ]; then
		patch="${CACHE_DIR}/$(wrap_get "${wrap}" patch_filename)"
		fetch "${patch}" "$(wrap_get "${wrap}" patch_url)" "$(wrap_get "${wrap}" patch_fallback_url)"
		check_hash "${patch}" "$(wrap_get "${wrap}" patch_hash)"
		unzip -qo "${patch}" -d "${SUBPROJECTS_DIR}"
	fi
	apply_packagefiles "${wrap}" "${SUBPROJECTS_DIR}/${dir}"
}

for name in "$@"; do
	wrap="${SUBPROJECTS_DIR}/${name}.wrap"
	if [ ! -f "${wrap}" ]; then
		echo "ERROR: missing ${wrap}" >&2
		exit 1
	fi
	if grep -q '^\[wrap-git\]' "${wrap}"; then
		fetch_git_wrap "${name}" "${wrap}"
	elif grep -q '^\[wrap-file\]' "${wrap}"; then
		fetch_file_wrap "${name}" "${wrap}"
	else
		echo "ERROR: ${name}: unsupported wrap type" >&2
		exit 1
	fi
done

#!/bin/bash

if [ $# -eq 0 ]; then
	echo 'This script requires three arguments,'
	echo 'the first being the source directory, the second the target,'
	echo 'and the third the build directory.'
	echo 'For example...'
	echo
	echo './watcher.sh $HOME/batocera.linux x86_64 $HOME/build-dir/batocera.x86_64'
	exit 1
fi

srcdir="${1:-/home/lee/batocera.se}"
board="${2:-x86_64}"
outdir="${3:-/home/lee/build-dir/batocera.$board}"
build_dir="$outdir/build"

watch() {
	echo "Source Dir: $srcdir"
	echo "Target:     $board"
	echo "Build Dir:  $outdir"

	mapfile -t build_list < <(make O="$outdir" BR2_EXTERNAL="$srcdir" -C "$srcdir/buildroot" show-build-order | grep -v -e ' ' -e '#')
	shopt -s nullglob
	tail -f "${build_dir}/build-time.log" | while read -r line; do
		progress_list=( "${build_dir}"/*/.stamp_installed )
		if [[ $line =~ ^[0-9]+\.[0-9]+: ]]; then
			line=${line#*:}                                         # strip unwanted timestamp
		fi
		[[ $line =~ end\ +:install ]] && eol="\n" || eol="\r"       # only linefeed when task is done
		printf 'Package Count: %d / %d : %s : %s'"$eol" \
			"${#progress_list[@]}" \
			"${#build_list[@]}" \
			"$(date -Iseconds)" \
			"$line"
	done
}

watch

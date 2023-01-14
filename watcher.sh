#!/bin/bash

echo 'This script requires three arguments,'
echo 'the first been the source directory, the second been the target,'
echo 'and the thrid been the build directory.'
echo 'For example...'
echo
echo './watcher.sh $HOME/batocera.linux x86_64 $HOME/batocera.x86_64'
echo

srcdir="${1:-/home/lee/batocera.piboy}"
board="${2:-x86_64}"
outdir="${3:-/home/lee/batocera.$board}"
build_dir="$outdir/build"
	
watch() {
	echo "Source Dir: $srcdir"
	echo "Target:     $board"
	echo "Build Dir:  $outdir"

	build_list=($(make O="$outdir" BR2_EXTERNAL="$srcdir" -C "$srcdir/buildroot" show-build-order | grep -v " " | grep -v \#))
	tail -f "${build_dir}/build-time.log" | while read -r line; do
		progress_list=( "${build_dir}"/*/.stamp_installed )
		line=$(sed -E 's/[0-9]+\.[0-9]+\://' <<< "$line")       # strip unwanted timestamp
	    [[ $line =~ end\ +\:install ]] && eol="\n" || eol="\r"  # only linefeed when task is done
		printf 'Package Count: %d / %d : %s : %s'"$eol" \
			"${#progress_list[@]}" \
			"${#build_list[@]}" \
			"$(date -Iseconds)" \
			"$line"
	done
}

watch "$board"

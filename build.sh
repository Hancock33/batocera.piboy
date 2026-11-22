#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"

usage() {
    echo 'This script requires two arguments:'
    echo 'the output directory and the target.'
    echo 'For example...'
    echo
    echo "  $0 \$HOME/batocera.piboy4 piboy4"
    echo
    echo "You can list the targets with $0 list-targets"
}

if [[ "${1:-}" == "list-targets" ]]; then
    find "$ROOT/configs" -maxdepth 1 -name 'batocera-*.board' | sed -n 's/.*\/batocera-\(.*\)\.board$/\1/p' | sort
    exit 0
fi

if [[ $# -ne 2 ]]; then
    usage
    exit 1
fi

OUTPUT="$1"
TARGET="$2"

if [[ ! -f "$ROOT/configs/batocera-$TARGET.board" ]]; then
    echo "Unknown target: $TARGET" >&2
    echo "Run '$0 list-targets' to see the available targets." >&2
    exit 1
fi

"$ROOT/configs/createDefconfig.sh" "$ROOT/configs/batocera-$TARGET"
trap 'rm -f "$ROOT/configs/batocera-${TARGET}_defconfig"' EXIT
make O="$OUTPUT" BR2_EXTERNAL="$ROOT" -C "$ROOT/buildroot" "batocera-${TARGET}_defconfig"

echo "Output Dir:    $OUTPUT"
echo "Buildroot Dir: $ROOT/buildroot"
echo "Target:        $TARGET"

#!/bin/bash
# Leave the board trees of unsupported vendors out of the working tree.
#
# They are only needed to build boards in configs/unsupported/, and are about
# half of the checkout. Nothing is deleted from the repository: the files stay
# in git, upstream merges still update them, and "off" brings them back.
#
# usage: scripts/linux/sparse-checkout.sh on|off|status

set -euo pipefail

cd "$(git -C "$(dirname "$0")" rev-parse --show-toplevel)"

# Vendor trees no supported board (piboy4, x86_64) reads from.
EXCLUDED="allwinner amlogic qualcomm rockchip samsung starfive"

case "${1:-status}" in
    on)
        patterns=('/*')
        for vendor in ${EXCLUDED}; do
            patterns+=("!/board/batocera/${vendor}/")
        done
        git sparse-checkout set --no-cone "${patterns[@]}"
        echo "Sparse checkout on. Left out: ${EXCLUDED}"
        ;;
    off)
        git sparse-checkout disable
        echo "Sparse checkout off. Full tree restored."
        ;;
    status)
        if [ "$(git config --get core.sparseCheckout || echo false)" = "true" ]; then
            echo "Sparse checkout is on:"
            git sparse-checkout list
        else
            echo "Sparse checkout is off."
        fi
        ;;
    *)
        echo "usage: $0 on|off|status" >&2
        exit 2
        ;;
esac

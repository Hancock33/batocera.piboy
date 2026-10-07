
#!/usr/bin/env bash
#
# Toggles the "lizard_mode" parameter of the hid_steam kernel module,
# which controls the fallback mouse/keyboard emulation on Steam
# Controller / Steam Deck input devices.

set -euo pipefail

PARAM_PATH="/sys/module/hid_steam/parameters/lizard_mode"

if [[ ! -e "$PARAM_PATH" ]]; then
    echo "Error: $PARAM_PATH does not exist." >&2
    echo "Is the hid_steam kernel module loaded? Try: sudo modprobe hid_steam" >&2
    exit 1
fi

current="$(<"$PARAM_PATH")"
case "$current" in
    Y|1)
        new="0"
        state="disabled"
        ;;
    N|0)
        new="1"
        state="enabled"
        ;;
    *)
        echo "Error: unexpected current value '$current' in $PARAM_PATH" >&2
        exit 1
        ;;
esac

echo "$new" > "$PARAM_PATH"
echo "lizard_mode was '$current', now $state (wrote '$new')."

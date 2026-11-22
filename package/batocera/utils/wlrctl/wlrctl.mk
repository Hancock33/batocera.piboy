################################################################################
#
# wlrctl
#
################################################################################
# Version: Commits on May 16, 2023
WLRCTL_VERSION = v0.2.2
WLRCTL_SITE = https://git.sr.ht/~brocellous/wlrctl/archive
WLRCTL_SOURCE = $(WLRCTL_VERSION).tar.gz
WLRCTL_LICENSE = MIT

WLRCTL_DEPENDENCIES = libxkbcommon wayland

WLRCTL_CONF_OPTS = -Dzsh-completions=false

$(eval $(meson-package))

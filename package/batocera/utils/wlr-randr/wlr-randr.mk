################################################################################
#
# wlr-randr
#
################################################################################
# Version: Commits on Mar 06, 2024
WLR_RANDR_VERSION = 0.4.1
WLR_RANDR_SITE = https://git.sr.ht/~emersion/wlr-randr/refs/download/v$(WLR_RANDR_VERSION)
WLR_RANDR_LICENSE = MIT
WLR_RANDR_LICENSE_FILES = LICENSE

$(eval $(meson-package))

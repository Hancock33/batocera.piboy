################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Oct 28, 2026
CLEVIS_VERSION = 2f172922eb0f3e957129c25e43c5c0b638e84745
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

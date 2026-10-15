################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Oct 14, 2026
CLEVIS_VERSION = 1c50051feb4fa3d8a1e7017202ba1e18f8601360
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

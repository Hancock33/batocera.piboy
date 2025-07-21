################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Jul 21, 2025
CLEVIS_VERSION = 0317bf386f077df679ba0e9d8a19e3c7f6e8bac4
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

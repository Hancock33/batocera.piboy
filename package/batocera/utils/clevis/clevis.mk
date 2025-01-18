################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Jan 15, 2025
CLEVIS_VERSION = 106d4aefa1b588d7ce49791ea0195e183ed58cc0
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

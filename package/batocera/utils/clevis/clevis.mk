################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Jan 07, 2025
CLEVIS_VERSION = 0839ee294a2cbb0c1ecf1749c9ca530ef9f59f8f
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))
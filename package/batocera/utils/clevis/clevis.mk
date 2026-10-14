################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Oct 14, 2026
CLEVIS_VERSION = 2c587b144976a641a98a7af99b450a2f1b28ff7f
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

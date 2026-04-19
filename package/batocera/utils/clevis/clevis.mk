################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Sept 07, 2025
CLEVIS_VERSION = 38ea99b9b36a9267baec05c5a3806def006d48e4
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

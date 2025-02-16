################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Feb 11, 2025
CLEVIS_VERSION = 519367442367f5682e31ac2a8cf88002d44e80d9
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

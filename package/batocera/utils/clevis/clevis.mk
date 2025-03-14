################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Mar 14, 2025
CLEVIS_VERSION = e010e18a1b456d4c60864951aa9839df7a0b65e2
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Oct 17, 2024
CLEVIS_VERSION = ea01ad0c954ac478e72881504d8b7b0486431526
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

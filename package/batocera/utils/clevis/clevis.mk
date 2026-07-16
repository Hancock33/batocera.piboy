################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Jun 18, 2026
CLEVIS_VERSION = bcac5294e205a0b7d81aad6319f807e762266426
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

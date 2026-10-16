################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Oct 16, 2026
CLEVIS_VERSION = a0be5777495b0ddb28f8452c4b7276d308d4b3ee
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

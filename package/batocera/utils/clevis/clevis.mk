################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Apr 30, 2026
CLEVIS_VERSION = 23679e1a4d0a48f5f5f1b9c284f8ed8a5120f52a
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

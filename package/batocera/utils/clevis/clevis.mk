################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Oct 15, 2026
CLEVIS_VERSION = 1b911c50d7ca36b66b0d2c908ba3c6db1c6847cb
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Aug 31, 2025
CLEVIS_VERSION = 0357b4be5a6d33317acb758c352244ec0bb70740
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

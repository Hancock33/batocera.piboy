################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Jul 07, 2026
CLEVIS_VERSION = 1c9e927587918ef009503b39a504ef2a5d02c4fb
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

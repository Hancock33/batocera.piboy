################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Mar 06, 2026
CLEVIS_VERSION = 10c396572d572466e370604958377f5f87a052f8
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

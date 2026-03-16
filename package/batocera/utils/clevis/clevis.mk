################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Mar 16, 2026
CLEVIS_VERSION = bf9e9ab36ce5d10bff976e708100e88dd4f90131
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

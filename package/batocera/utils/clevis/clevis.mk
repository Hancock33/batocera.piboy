################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Nov 18, 2026
CLEVIS_VERSION = dcabb67e3d8ce3d09980005af541d844b32bd84b
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPL-3.0
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

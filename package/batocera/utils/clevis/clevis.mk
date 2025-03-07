################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Mar 07, 2025
CLEVIS_VERSION = a13c1509aa8b1a132a2899ba9e3ad65ed8c7f2f7
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Jul 10, 2025
CLEVIS_VERSION = 321fc34c57bac7c757af2a3ced11bac977553cad
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

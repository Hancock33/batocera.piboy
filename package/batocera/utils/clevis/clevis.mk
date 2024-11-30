################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Nov 23, 2024
CLEVIS_VERSION = 29d0a4ea7b978ca0b911e293b76bcaffbea1cc25
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Jul 25, 2025
CLEVIS_VERSION = 2ad7027b7182b8f46404f8ec0735a83738f7ca7f
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

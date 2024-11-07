################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Oct 12, 2024
CLEVIS_VERSION = 4fc81301b442c4c6b336600823fd4ef385691c28
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

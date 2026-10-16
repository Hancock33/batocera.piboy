################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Oct 16, 2026
CLEVIS_VERSION = c3170a3594076c99a92f8c73cd485017a9d67641
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

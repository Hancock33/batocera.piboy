################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Oct 29, 2026
CLEVIS_VERSION = 6c34d97f9c2f9027c5f00aac776d58f63cdaf006
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Feb 28, 2025
CLEVIS_VERSION = f437c24709589aa006b2ede9ab16da19bcfdf66d
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

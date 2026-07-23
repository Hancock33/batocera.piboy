################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Jul 17, 2026
CLEVIS_VERSION = 15c4e415df2754dbd274fbcfc629d74d94005864
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

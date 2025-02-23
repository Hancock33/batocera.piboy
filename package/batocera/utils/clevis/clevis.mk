################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Feb 19, 2025
CLEVIS_VERSION = 5aba7d6c55969bc08c28bfa13111091830305da3
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

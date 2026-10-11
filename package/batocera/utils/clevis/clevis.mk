################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Oct 09, 2026
CLEVIS_VERSION = 65655289ffa918867161c73b747b52c8cc159c9b
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

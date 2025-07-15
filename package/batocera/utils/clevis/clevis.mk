################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Jul 15, 2025
CLEVIS_VERSION = be74547433b48d189af63aa79cd167e9ae08c026
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

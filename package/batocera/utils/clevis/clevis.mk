################################################################################
#
# clevis
#
################################################################################
# Version: Commits on Nov 07, 2024
CLEVIS_VERSION = 4ba3f7928fcaba3af9f908661b16007dbb1ee46b
CLEVIS_SITE = $(call github,latchset,clevis,$(CLEVIS_VERSION))
CLEVIS_LICENSE = GPLv3
CLEVIS_LICENSE_FILES = COPYING

CLEVIS_DEPENDENCIES = cryptsetup host-cryptsetup jose luksmeta tpm2-tools

$(eval $(meson-package))

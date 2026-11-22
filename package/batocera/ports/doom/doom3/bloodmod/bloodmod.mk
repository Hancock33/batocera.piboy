################################################################################
#
# bloodmod
#
################################################################################
# Version: Commits on Jun 07, 2026
BLOODMOD_VERSION = 67bc24c623232efd947f9005026f7ac6dabc62d9
BLOODMOD_SITE = $(call github,dhewm,dhewm3-sdk,$(BLOODMOD_VERSION))
BLOODMOD_BRANCH = bloodmod
BLOODMOD_LICENSE = GPL-3.0
BLOODMOD_LICENSE_FILES = COPYING.txt

BLOODMOD_DEPENDENCIES = dhewm3

define BLOODMOD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/lib/dhewm3 $(@D)/bloodmod*.so
endef

$(eval $(cmake-package))

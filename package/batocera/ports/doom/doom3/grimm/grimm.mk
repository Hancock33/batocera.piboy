################################################################################
#
# grimm
#
################################################################################
# Version: Commits on Jun 07, 2026
GRIMM_VERSION = 34cb764c9e618c3073ed645ac71666559334bb17
GRIMM_SITE = $(call github,dhewm,dhewm3-sdk,$(GRIMM_VERSION))
GRIMM_BRANCH = grimm
GRIMM_LICENSE = GPL-3.0
GRIMM_LICENSE_FILES = COPYING.txt

GRIMM_DEPENDENCIES = dhewm3

define GRIMM_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/lib/dhewm3 $(@D)/grimm*.so
endef

$(eval $(cmake-package))

################################################################################
#
# eldoom
#
################################################################################
# Version: Commits on Jun 07, 2026
ELDOOM_VERSION = e6461952e6d2dc882ad06d365ec78c7c0eebcce4
ELDOOM_SITE = $(call github,dhewm,dhewm3-sdk,$(ELDOOM_VERSION))
ELDOOM_BRANCH = eldoom
ELDOOM_LICENSE = GPL-3.0
ELDOOM_LICENSE_FILES = COPYING.txt

ELDOOM_DEPENDENCIES = dhewm3

define ELDOOM_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D -t $(TARGET_DIR)/usr/lib/dhewm3 $(@D)/eldoom*.so
endef

$(eval $(cmake-package))

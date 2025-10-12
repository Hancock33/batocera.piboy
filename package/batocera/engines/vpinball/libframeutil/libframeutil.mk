################################################################################
#
# libframeutil
#
################################################################################
# Version: Commits on Apr 13, 2024
LIBFRAMEUTIL_VERSION = 30048ca23d41ca0a8f7d5ab75d3f646a19a90182
LIBFRAMEUTIL_SITE = $(call github,ppuc,libframeutil,$(LIBFRAMEUTIL_VERSION))
LIBFRAMEUTIL_LICENSE = GPLv3
LIBFRAMEUTIL_LICENSE_FILES = LICENSE

define LIBFRAMEUTIL_INSTALL_TARGET_CMDS
	cp $(@D)/include/FrameUtil.h $(STAGING_DIR)/usr/include
endef

$(eval $(generic-package))

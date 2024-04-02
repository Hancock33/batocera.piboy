################################################################################
#
# libzedmd
#
################################################################################
# Version: Commits on Apr 02, 2024
LIBFRAMEUTIL_VERSION = 4da694f9518a01fcf13105c33c2ae1a396ec0aea
LIBFRAMEUTIL_SITE = $(call github,ppuc,libframeutil,$(LIBFRAMEUTIL_VERSION))
LIBFRAMEUTIL_LICENSE = GPLv3
LIBFRAMEUTIL_LICENSE_FILES = LICENSE

define LIBFRAMEUTIL_INSTALL_TARGET_CMDS
	cp $(@D)/include/FrameUtil.h $(STAGING_DIR)/usr/include
endef

$(eval $(generic-package))

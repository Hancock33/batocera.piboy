################################################################################
#
# libframeutil
#
################################################################################
# Version: Commits on Nov 06, 2026
LIBFRAMEUTIL_VERSION = aa2a26dc8e852cff710e398d50cd8574460e6c5f
LIBFRAMEUTIL_SITE = $(call github,ppuc,libframeutil,$(LIBFRAMEUTIL_VERSION))
LIBFRAMEUTIL_LICENSE = GPLv3
LIBFRAMEUTIL_LICENSE_FILES = LICENSE

define LIBFRAMEUTIL_INSTALL_TARGET_CMDS
	cp $(@D)/include/FrameUtil.h $(STAGING_DIR)/usr/include
endef

$(eval $(generic-package))

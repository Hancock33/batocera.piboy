################################################################################
#
# libframeutil
#
################################################################################
# Version: Commits on Aug 20, 2026
LIBFRAMEUTIL_VERSION = ef52fb829c34f1c4a24cac7503eb3154b06317ed
LIBFRAMEUTIL_SITE = $(call github,ppuc,libframeutil,$(LIBFRAMEUTIL_VERSION))
LIBFRAMEUTIL_LICENSE = GPLv3
LIBFRAMEUTIL_LICENSE_FILES = LICENSE

define LIBFRAMEUTIL_INSTALL_TARGET_CMDS
	cp $(@D)/include/FrameUtil.h $(STAGING_DIR)/usr/include
endef

$(eval $(generic-package))

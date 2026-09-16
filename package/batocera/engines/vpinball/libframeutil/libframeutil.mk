################################################################################
#
# libframeutil
#
################################################################################
# Version: Commits on Sept 10, 2026
LIBFRAMEUTIL_VERSION = 711ab21dcf9ad33d8db8339dfd3b1548bcc34cdb
LIBFRAMEUTIL_SITE = $(call github,ppuc,libframeutil,$(LIBFRAMEUTIL_VERSION))
LIBFRAMEUTIL_LICENSE = GPLv3
LIBFRAMEUTIL_LICENSE_FILES = LICENSE

define LIBFRAMEUTIL_INSTALL_TARGET_CMDS
	cp $(@D)/include/FrameUtil.h $(STAGING_DIR)/usr/include
endef

$(eval $(generic-package))

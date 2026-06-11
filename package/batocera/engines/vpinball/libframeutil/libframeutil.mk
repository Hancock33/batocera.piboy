################################################################################
#
# libframeutil
#
################################################################################
# Version: Commits on Jun 10, 2026
LIBFRAMEUTIL_VERSION = 28f2bae0dabcbd5c599e6f62211f009e078c1f96
LIBFRAMEUTIL_SITE = $(call github,ppuc,libframeutil,$(LIBFRAMEUTIL_VERSION))
LIBFRAMEUTIL_LICENSE = GPLv3
LIBFRAMEUTIL_LICENSE_FILES = LICENSE

define LIBFRAMEUTIL_INSTALL_TARGET_CMDS
	cp $(@D)/include/FrameUtil.h $(STAGING_DIR)/usr/include
endef

$(eval $(generic-package))

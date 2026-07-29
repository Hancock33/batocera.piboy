################################################################################
#
# libframeutil
#
################################################################################
# Version: Commits on Jul 22, 2026
LIBFRAMEUTIL_VERSION = 6bd462a3fcae77ee481c8b1cc863bd54cc40456f
LIBFRAMEUTIL_SITE = $(call github,ppuc,libframeutil,$(LIBFRAMEUTIL_VERSION))
LIBFRAMEUTIL_LICENSE = GPLv3
LIBFRAMEUTIL_LICENSE_FILES = LICENSE

define LIBFRAMEUTIL_INSTALL_TARGET_CMDS
	cp $(@D)/include/FrameUtil.h $(STAGING_DIR)/usr/include
endef

$(eval $(generic-package))

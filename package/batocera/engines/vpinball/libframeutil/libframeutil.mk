################################################################################
#
# libframeutil
#
################################################################################
# Version: Commits on Jan 22, 2026
LIBFRAMEUTIL_VERSION = 03d2483d5cded0bdef84bec24c9ddfdede324b5c
LIBFRAMEUTIL_SITE = $(call github,ppuc,libframeutil,$(LIBFRAMEUTIL_VERSION))
LIBFRAMEUTIL_LICENSE = GPLv3
LIBFRAMEUTIL_LICENSE_FILES = LICENSE

define LIBFRAMEUTIL_INSTALL_TARGET_CMDS
	cp $(@D)/include/FrameUtil.h $(STAGING_DIR)/usr/include
endef

$(eval $(generic-package))

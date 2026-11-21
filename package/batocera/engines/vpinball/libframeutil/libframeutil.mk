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

LIBFRAMEUTIL_INSTALL_STAGING = YES
LIBFRAMEUTIL_INSTALL_TARGET = NO

# Header-only library
define LIBFRAMEUTIL_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/include/FrameUtil.h $(STAGING_DIR)/usr/include/FrameUtil.h
endef

$(eval $(generic-package))

################################################################################
#
# libzedmd
#
################################################################################
# Version: Commits on Apr 02, 2024
LIBFRAMEUTIL_VERSION = d9bde3069786f1a33d2021afe19566d812e873f5
LIBFRAMEUTIL_SITE = $(call github,ppuc,libframeutil,$(LIBFRAMEUTIL_VERSION))
LIBFRAMEUTIL_LICENSE = GPLv3
LIBFRAMEUTIL_LICENSE_FILES = LICENSE

define LIBFRAMEUTIL_INSTALL_TARGET_CMDS
	cp $(@D)/include/FrameUtil.h $(STAGING_DIR)/usr/include
endef

$(eval $(generic-package))

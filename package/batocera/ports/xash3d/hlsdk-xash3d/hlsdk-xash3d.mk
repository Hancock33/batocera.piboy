################################################################################
#
# hlsdk-xash3d
#
################################################################################
# Version: Commits on May 24, 2026
HLSDK_XASH3D_VERSION = 150497c3b5ca3c364a970613dbe58d5aa424f295
HLSDK_XASH3D_BRANCH = mobile_hacks
HLSDK_XASH3D_SITE = $(call github,FWGS,hlsdk-portable,$(HLSDK_XASH3D_VERSION))
HLSDK_XASH3D_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf libsodium
HLSDK_XASH3D_LICENSE = Half Life 1 SDK LICENSE
HLSDK_XASH3D_LICENSE_FILES = LICENSE

ifeq ($(BR2_ARCH_IS_64),y)
HLSDK_XASH3D_CONF_OPTS += -D64BIT=ON
endif

define HLSDK_XASH3D_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/hl/cl_dlls/ -D $(@D)/cl_dll/*.so
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/hl/dlls/ -D $(@D)/dlls/*.so
endef

$(eval $(cmake-package))

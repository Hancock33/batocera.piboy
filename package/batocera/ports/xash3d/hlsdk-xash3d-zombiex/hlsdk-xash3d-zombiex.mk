################################################################################
#
# hlsdk-xash3d-zombiex
#
################################################################################
# Version: Commits on Aug 19, 2025
HLSDK_XASH3D_ZOMBIEX_VERSION = c431cea986dde9da67f4f0f2170e43f7ab0fbfc9
HLSDK_XASH3D_ZOMBIEX_BRANCH = zombie-x
HLSDK_XASH3D_ZOMBIEX_SITE = $(call github,FWGS,hlsdk-portable,$(HLSDK_XASH3D_ZOMBIEX_VERSION))
HLSDK_XASH3D_ZOMBIEX_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf libsodium
HLSDK_XASH3D_ZOMBIEX_LICENSE = Half Life 1 SDK LICENSE
HLSDK_XASH3D_ZOMBIEX_LICENSE_FILES = LICENSE

HLSDK_XASH3D_ZOMBIEX_CONF_OPTS = -DGOLDSOURCE_SUPPORT=1 -DSERVER_LIBRARY_NAME=zombie -DGAMEDIR=zombie

ifeq ($(BR2_ARCH_IS_64),y)
HLSDK_XASH3D_ZOMBIEX_CONF_OPTS += -D64BIT=ON
endif

define HLSDK_XASH3D_ZOMBIEX_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/zombie/cl_dlls/ -D $(@D)/cl_dll/*.so
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/zombie/dlls/ -D $(@D)/dlls/*.so
endef

$(eval $(cmake-package))

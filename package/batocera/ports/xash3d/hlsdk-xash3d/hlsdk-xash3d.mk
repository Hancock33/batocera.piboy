################################################################################
#
# hlsdk-xash3d
#
################################################################################
# Version: Commits on Jan 03, 2025
HLSDK_XASH3D_VERSION = c525400a30b6b96b22e0fa4e3f39712c7a390b08
HLSDK_XASH3D_BRANCH = mobile_hacks
HLSDK_XASH3D_SITE = $(call github,FWGS,hlsdk-portable,$(HLSDK_XASH3D_VERSION))
HLSDK_XASH3D_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf libsodium
HLSDK_XASH3D_LICENSE = Half Life 1 SDK LICENSE
HLSDK_XASH3D_LICENSE_FILES = LICENSE

HLSDK_XASH3D_CONF_OPTS = --build-type=release

ifeq ($(BR2_ARCH_IS_64),y)
HLSDK_XASH3D_CONF_OPTS += --64bits
endif

define HLSDK_XASH3D_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/hl/cl_dlls/ -D $(@D)/build/cl_dll/*.so
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/hl/dlls/ -D $(@D)/build/dlls/*.so
endef

$(eval $(waf-package))

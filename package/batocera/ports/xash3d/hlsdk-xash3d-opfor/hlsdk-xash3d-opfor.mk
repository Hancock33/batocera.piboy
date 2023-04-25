################################################################################
#
# hlsdk-xash3d-opfor
#
################################################################################
# Version: Commits on Apr 25, 2023 (branch@opfor)
HLSDK_XASH3D_OPFOR_VERSION = e13192ee20e1fed1eeb8ae74cd7bd0b719c2751e
HLSDK_XASH3D_OPFOR_SITE = $(call github,FWGS,hlsdk-portable,$(HLSDK_XASH3D_OPFOR_VERSION))
HLSDK_XASH3D_OPFOR_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf libsodium host-ninja
HLSDK_XASH3D_OPFOR_LICENSE = Half Life 1 SDK LICENSE
HLSDK_XASH3D_OPFOR_LICENSE_FILES = LICENSE

HLSDK_XASH3D_OPFOR_CONF_OPTS = -DGOLDSOURCE_SUPPORT=1 -DSERVER_LIBRARY_NAME=opfor -DGAMEDIR=gearbox -GNinja

ifeq ($(BR2_ARCH_IS_64),y)
	HLSDK_XASH3D_OPFOR_CONF_OPTS += -D64BIT=ON
endif

define HLSDK_XASH3D_OPFOR_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(HLSDK_XASH3D_OPFOR_BUILDDIR)
endef

define HLSDK_XASH3D_OPFOR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/opfor/cl_dlls/ -D $(@D)/cl_dll/*.so
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/opfor/dlls/ -D $(@D)/dlls/*.so
endef

$(eval $(cmake-package))

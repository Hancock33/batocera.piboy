################################################################################
#
# hlsdk-xash3d-opfor
#
################################################################################
# Version: Commits on Feb 09, 2025
HLSDK_XASH3D_OPFOR_VERSION = fd90bb5fa4373c8a3465e565b455d3c3128b6eae
HLSDK_XASH3D_OPFOR_BRANCH = opforfixed
HLSDK_XASH3D_OPFOR_SITE = $(call github,FWGS,hlsdk-portable,$(HLSDK_XASH3D_OPFOR_VERSION))
HLSDK_XASH3D_OPFOR_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf libsodium
HLSDK_XASH3D_OPFOR_LICENSE = Half Life 1 SDK LICENSE
HLSDK_XASH3D_OPFOR_LICENSE_FILES = LICENSE

HLSDK_XASH3D_OPFOR_CONF_OPTS = -DGOLDSOURCE_SUPPORT=1 -DSERVER_LIBRARY_NAME=opfor -DGAMEDIR=gearbox

ifeq ($(BR2_ARCH_IS_64),y)
HLSDK_XASH3D_OPFOR_CONF_OPTS += -D64BIT=ON
endif

define HLSDK_XASH3D_OPFOR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/opfor/cl_dlls/ -D $(@D)/cl_dll/*.so
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/opfor/dlls/ -D $(@D)/dlls/*.so
endef

$(eval $(cmake-package))

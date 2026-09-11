################################################################################
#
# hlsdk-xash3d-opfor
#
################################################################################
# Version: Commits on Sept 10, 2026
HLSDK_XASH3D_OPFOR_VERSION = b93389d136ac130fe3a204a5e2d5c6a628d161af
HLSDK_XASH3D_OPFOR_BRANCH = opforfixed
HLSDK_XASH3D_OPFOR_SITE = https://github.com/FWGS/hlsdk-portable.git
HLSDK_XASH3D_OPFOR_SITE_METHOD=git
HLSDK_XASH3D_OPFOR_GIT_SUBMODULES=YES
HLSDK_XASH3D_OPFOR_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf libsodium
HLSDK_XASH3D_OPFOR_LICENSE = Half Life 1 SDK LICENSE
HLSDK_XASH3D_OPFOR_LICENSE_FILES = LICENSE

HLSDK_XASH3D_OPFOR_CONF_OPTS += -DGOLDSOURCE_SUPPORT=1
HLSDK_XASH3D_OPFOR_CONF_OPTS += -DSERVER_LIBRARY_NAME=opfor
HLSDK_XASH3D_OPFOR_CONF_OPTS += -DGAMEDIR=gearbox

ifeq ($(BR2_ARCH_IS_64),y)
HLSDK_XASH3D_OPFOR_CONF_OPTS += -D64BIT=ON
endif

define HLSDK_XASH3D_OPFOR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/opfor/cl_dlls/ -D $(@D)/cl_dll/*.so
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/opfor/dlls/ -D $(@D)/dlls/*.so
endef

$(eval $(cmake-package))

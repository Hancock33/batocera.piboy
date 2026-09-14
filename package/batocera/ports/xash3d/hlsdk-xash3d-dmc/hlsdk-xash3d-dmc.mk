################################################################################
#
# hlsdk-xash3d-dmc
#
################################################################################
# Version: Commits on Sept 13, 2026
HLSDK_XASH3D_DMC_VERSION = 913c221d513ae4a32d9f3ea448c81f00628a25af
HLSDK_XASH3D_DMC_BRANCH = dmc
HLSDK_XASH3D_DMC_SITE = https://github.com/FWGS/hlsdk-portable.git
HLSDK_XASH3D_DMC_SITE_METHOD=git
HLSDK_XASH3D_DMC_GIT_SUBMODULES=YES
HLSDK_XASH3D_DMC_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf libsodium
HLSDK_XASH3D_DMC_LICENSE = Half Life 1 SDK LICENSE
HLSDK_XASH3D_DMC_LICENSE_FILES = LICENSE

HLSDK_XASH3D_DMC_CONF_OPTS = -DGOLDSOURCE_SUPPORT=1 -DSERVER_LIBRARY_NAME=dmc -DGAMEDIR=dmc
HLSDK_XASH3D_DMC_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS)"

ifeq ($(BR2_ARCH_IS_64),y)
HLSDK_XASH3D_DMC_CONF_OPTS += -D64BIT=ON
endif

define HLSDK_XASH3D_DMC_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/dmc/cl_dlls/ -D $(@D)/cl_dll/*.so
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/lib/xash3d/hlsdk/dmc/dlls/ -D $(@D)/dlls/*.so
endef

$(eval $(cmake-package))

################################################################################
#
# libretro-dolphin
#
################################################################################
# Version: Commits on Sept 30, 2022
LIBRETRO_DOLPHIN_VERSION = 9810e29a1f3633d32b6643b97a1147d83311d73a
LIBRETRO_DOLPHIN_SITE = https://github.com/libretro/dolphin
LIBRETRO_DOLPHIN_SITE_METHOD=git
LIBRETRO_DOLPHIN_GIT_SUBMODULES=YES
LIBRETRO_DOLPHIN_LICENSE = GPLv2
LIBRETRO_DOLPHIN_DEPENDENCIES = retroarch libevdev fmt bluez5_utils

LIBRETRO_DOLPHIN_PLATFORM = $(LIBRETRO_PLATFORM)

LIBRETRO_DOLPHIN_CONF_OPTS = -DLIBRETRO=ON -DBUILD_SHARED_LIBS=OFF \
							 -DENABLE_LTO=ON -DCMAKE_BUILD_TYPE=Release

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
LIBRETRO_DOLPHIN_DEPENDENCIES += xserver_xorg-server
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_X11=ON
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_EGL=OFF
endif

define LIBRETRO_DOLPHIN_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/dolphin_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/dolphin_libretro.so
endef

$(eval $(cmake-package))

################################################################################
#
# libretro-dolphin
#
################################################################################
# Version: Commits on May 17, 2025
LIBRETRO_DOLPHIN_VERSION = a09f78f735f0d2184f64ba5b134abe98ee99c65f
LIBRETRO_DOLPHIN_SITE = $(call github,libretro,dolphin,$(LIBRETRO_DOLPHIN_VERSION))
LIBRETRO_DOLPHIN_LICENSE = GPLv2
LIBRETRO_DOLPHIN_DEPENDENCIES = fmt bluez5_utils libevdev retroarch

LIBRETRO_DOLPHIN_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_NOGUI=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_QT=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DLIBRETRO=ON
LIBRETRO_DOLPHIN_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
    LIBRETRO_DOLPHIN_DEPENDENCIES += xserver_xorg-server
    LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_X11=ON
else
    LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_X11=OFF
endif

define LIBRETRO_DOLPHIN_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/dolphin_libretro.so $(TARGET_DIR)/usr/lib/libretro/dolphin_libretro.so
endef

define LIBRETRO_DOLPHIN_SYS_FOLDER
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/dolphin-emu/Sys
	cp -r $(@D)/Data/Sys/* $(TARGET_DIR)/usr/share/batocera/datainit/bios/dolphin-emu/Sys
endef

LIBRETRO_DOLPHIN_POST_INSTALL_TARGET_HOOKS += LIBRETRO_DOLPHIN_SYS_FOLDER

$(eval $(cmake-package))

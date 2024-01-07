################################################################################
#
# libretro-dolphin
#
################################################################################
# Version: Commits on Dec 17, 2022
LIBRETRO_DOLPHIN_VERSION = 2f4b0f7902257d40a054f60b2c670d6e314f2a04
LIBRETRO_DOLPHIN_SITE = $(call github,libretro,dolphin,$(LIBRETRO_DOLPHIN_VERSION))
LIBRETRO_DOLPHIN_LICENSE = GPLv2
LIBRETRO_DOLPHIN_DEPENDENCIES = libevdev fmt bluez5_utils
LIBRETRO_DOLPHIN_PLATFORM = $(LIBRETRO_PLATFORM)

LIBRETRO_DOLPHIN_CONF_OPTS += -DLIBRETRO=ON
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_NOGUI=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_QT=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

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

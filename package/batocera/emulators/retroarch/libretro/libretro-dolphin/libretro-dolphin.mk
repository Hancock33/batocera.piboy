################################################################################
#
# libretro-dolphin
#
################################################################################
# Version: Commits on Feb 16, 2026
LIBRETRO_DOLPHIN_VERSION = 13192dec3d803029b636bfe1a71885d7d7e5205f
LIBRETRO_DOLPHIN_SITE = https://github.com/libretro/dolphin.git
LIBRETRO_DOLPHIN_SITE_METHOD = git
LIBRETRO_DOLPHIN_GIT_SUBMODULES = YES
LIBRETRO_DOLPHIN_LICENSE = GPLv2
LIBRETRO_DOLPHIN_DEPENDENCIES = bluez5_utils cpp-ipc fmt libevdev retroarch
LIBRETRO_DOLPHIN_EMULATOR_INFO = dolphin.libretro.core.yml

LIBRETRO_DOLPHIN_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_ANALYTICS=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_LTO=ON
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_QT=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DLIBRETRO=ON
LIBRETRO_DOLPHIN_CONF_OPTS += -DUSE_RETRO_ACHIEVEMENTS=ON

ifeq ($(BR2_PACKAGE_XORG7),y)
    LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_X11=ON
else
    LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_X11=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_VULKAN=ON
else
    LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_VULKAN=OFF
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
$(eval $(emulator-info-package))

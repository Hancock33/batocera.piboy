################################################################################
#
# libretro-skyemu
#
################################################################################
# Version: Commits on Oct 13, 2026
LIBRETRO_SKYEMU_VERSION = 9b6bbb6aa73cebae6cb52ea60d04f803acadc480
LIBRETRO_SKYEMU_SITE =  $(call github,skylersaleh,SkyEmu,$(LIBRETRO_SKYEMU_VERSION))
LIBRETRO_SKYEMU_LICENSE = MIT
LIBRETRO_SKYEMU_EMULATOR_INFO = skyemu.libretro.core.yml
LIBRETRO_SKYEMU_DEPENDENCIES = retroarch sdl2

LIBRETRO_SKYEMU_CONF_OPTS += -DRETRO_CORE_ONLY=ON

define LIBRETRO_SKYEMU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/skyemu_libretro.so $(TARGET_DIR)/usr/lib/libretro/skyemu_libretro.so
	$(INSTALL) -D $(@D)/skyemu_libretro.info $(TARGET_DIR)/usr/share/libretro/info/skyemu_libretro.info
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))

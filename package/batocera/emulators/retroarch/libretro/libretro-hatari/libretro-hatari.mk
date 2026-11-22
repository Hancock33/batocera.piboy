################################################################################
#
# libretro-hatari
#
################################################################################
# Version: Commits on Nov 13, 2026
LIBRETRO_HATARI_VERSION = 4edc56f4e2add886ed5406854d12f95fdfdf67b6
LIBRETRO_HATARI_SITE = $(call github,libretro,hatari,$(LIBRETRO_HATARI_VERSION))
LIBRETRO_HATARI_DEPENDENCIES = libcapsimage zlib retroarch
LIBRETRO_HATARI_EMULATOR_INFO = hatari.libretro.core.yml
LIBRETRO_HATARI_LICENSE = GPL-2.0

LIBRETRO_HATARI_CONF_OPTS += -DENABLE_LIBRETRO=ON
LIBRETRO_HATARI_CONF_OPTS += -DENABLE_HATARI=OFF
LIBRETRO_HATARI_CONF_OPTS += -DENABLE_TOOLS=OFF
LIBRETRO_HATARI_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_Capstone=ON
LIBRETRO_HATARI_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_PortMidi=ON
LIBRETRO_HATARI_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_Udev=ON
LIBRETRO_HATARI_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_X11=ON

define LIBRETRO_HATARI_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/hatari_libretro.so $(TARGET_DIR)/usr/lib/libretro/hatari_libretro.so
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))

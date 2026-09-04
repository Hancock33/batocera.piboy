################################################################################
#
# libretro-hatari
#
################################################################################
# Version: Commits on Sept 03, 2026
LIBRETRO_HATARI_VERSION = 7fd34ccf34c6ea12b7f2b960b2f167d7f251892d
LIBRETRO_HATARI_SITE = $(call github,libretro,hatari,$(LIBRETRO_HATARI_VERSION))
LIBRETRO_HATARI_DEPENDENCIES = libcapsimage zlib retroarch
LIBRETRO_HATARI_EMULATOR_INFO = hatari.libretro.core.yml
LIBRETRO_HATARI_LICENSE = GPLv2

LIBRETRO_HATARI_CONF_OPTS += -DENABLE_LIBRETRO=ON
LIBRETRO_HATARI_CONF_OPTS += -DENABLE_HATARI=OFF
LIBRETRO_HATARI_CONF_OPTS += -DENABLE_TOOLS=OFF
LIBRETRO_HATARI_CONF_OPTS += -DENABLE_STATIC_ZLIB=ON
LIBRETRO_HATARI_CONF_OPTS += -DENABLE_STATIC_CAPSIMAGE=ON

define LIBRETRO_HATARI_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/src/hatari_libretro.so $(TARGET_DIR)/usr/lib/libretro/hatari_libretro.so
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))

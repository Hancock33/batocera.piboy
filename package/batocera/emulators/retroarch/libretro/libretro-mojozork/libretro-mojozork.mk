################################################################################
#
# libretro-mojozork
#
################################################################################
# Version: Commits on Jul 24, 2026
LIBRETRO_MOJOZORK_VERSION = f94c3104aa18036d9ed5f0243814483f82e486cb
LIBRETRO_MOJOZORK_SITE = $(call github,icculus,mojozork,$(LIBRETRO_MOJOZORK_VERSION))
LIBRETRO_MOJOZORK_LICENSE = Zlib
LIBRETRO_MOJOZORK_DEPENDENCIES = retroarch
LIBRETRO_MOJOZORK_EMULATOR_INFO = mojozork.libretro.core.yml

LIBRETRO_MOJOZORK_CONF_OPTS = -DMOJOZORK_LIBRETRO=ON -DMOJOZORK_STANDALONE_DEFAULT=OFF -DMOJOZORK_MULTIZORK_DEFAULT=OFF

define LIBRETRO_MOJOZORK_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/mojozork_libretro.so	$(TARGET_DIR)/usr/lib/libretro/mojozork_libretro.so
	$(INSTALL) -D $(@D)/mojozork_libretro.info $(TARGET_DIR)/usr/share/libretro/info/mojozork_libretro.info
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))

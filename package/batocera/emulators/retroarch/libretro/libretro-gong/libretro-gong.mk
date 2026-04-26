################################################################################
#
# libretro-gong
#
################################################################################
# Version: Commits on Apr 20, 2026
LIBRETRO_GONG_VERSION = 490528f8c35b5f8b03281fc69289c84b8b57c846
LIBRETRO_GONG_SITE = $(call github,libretro,gong,$(LIBRETRO_GONG_VERSION))
LIBRETRO_GONG_LICENSE = GPLv3
LIBRETRO_GONG_EMULATOR_INFO = gong.libretro.core.yml

define LIBRETRO_GONG_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	-C $(@D)/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_GONG_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/gong
	$(INSTALL) -D $(@D)/gong_libretro.so $(TARGET_DIR)/usr/lib/libretro/gong_libretro.so
	# install media
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-gong/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/gong/
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))

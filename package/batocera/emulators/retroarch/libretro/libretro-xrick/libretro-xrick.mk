################################################################################
#
# libretro-xrick
#
################################################################################
# Version: Commits on Jul 21, 2026
LIBRETRO_XRICK_VERSION = 35de6ac478c9998bcf79b6de2aca8dc371cd5ab1
LIBRETRO_XRICK_SITE = $(call github,libretro,xrick-libretro,$(LIBRETRO_XRICK_VERSION))
LIBRETRO_XRICK_LICENSE = GPL-3.0
LIBRETRO_XRICK_DEPENDENCIES += retroarch
LIBRETRO_XRICK_EMULATOR_INFO = xrick.libretro.core.yml

define LIBRETRO_XRICK_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_XRICK_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/xrick_libretro.so $(TARGET_DIR)/usr/lib/libretro/xrick_libretro.so
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/xrick
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-xrick/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/xrick/
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))

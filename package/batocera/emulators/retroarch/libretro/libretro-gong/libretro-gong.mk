################################################################################
#
# libretro-gong
#
################################################################################
# Version: Commits on May 30, 2022
LIBRETRO_GONG_VERSION = a5c593c5448044ff545f0dd5ef04043eb89e0f6f
LIBRETRO_GONG_SITE = $(call github,libretro,gong,$(LIBRETRO_GONG_VERSION))
LIBRETRO_GONG_LICENSE = GPLv3

define LIBRETRO_GONG_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
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

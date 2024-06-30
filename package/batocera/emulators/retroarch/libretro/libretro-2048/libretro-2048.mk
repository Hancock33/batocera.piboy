################################################################################
#
# libretro-2048
#
################################################################################
# Version: Commits on Jun 28, 2024
LIBRETRO_2048_VERSION = 5474ed1ab880b3296c9860d0943d7de1970c79dd
LIBRETRO_2048_SITE = $(call github,libretro,libretro-2048,$(LIBRETRO_2048_VERSION))
LIBRETRO_2048_LICENSE = UNLICENSE
LIBRETRO_2048_LICENSE_FILES = LICENSE

define LIBRETRO_2048_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_2048_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_2048_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/2048
	$(INSTALL) -D $(@D)/2048_libretro.so $(TARGET_DIR)/usr/lib/libretro/2048_libretro.so
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-2048/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/2048/
endef

$(eval $(generic-package))

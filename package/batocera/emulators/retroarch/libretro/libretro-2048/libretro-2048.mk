################################################################################
#
# libretro-2048
#
################################################################################
# Version: Commits on Nov 10, 2022
LIBRETRO_2048_VERSION = 0edef01f4c2dd2cbd0bb66b888ca4b57fad297d1
LIBRETRO_2048_SITE = $(call github,libretro,libretro-2048,$(LIBRETRO_2048_VERSION))
LIBRETRO_2048_LICENSE = UNLICENSE
LIBRETRO_2048_LICENSE_FILES = LICENSE

define LIBRETRO_2048_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix" \
        GIT_VERSION="-$(shell echo $(LIBRETRO_2048_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_2048_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/2048_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/2048_libretro.so
	# install media
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/2048
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-2048/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/2048/
endef

$(eval $(generic-package))

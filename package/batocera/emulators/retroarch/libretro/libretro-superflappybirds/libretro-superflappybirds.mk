################################################################################
#
# libretro-superflappybirds
#
################################################################################
# Version: Commits on Apr 13, 2023
LIBRETRO_SUPERFLAPPYBIRDS_VERSION = 4b798ecc6948017ca79aad1ea20fe57e680228c8
LIBRETRO_SUPERFLAPPYBIRDS_SITE = $(call github,IgniparousTempest,libretro-superflappybirds,$(LIBRETRO_SUPERFLAPPYBIRDS_VERSION))

LIBRETRO_SUPERFLAPPYBIRDS_LICENSE = GPL-3.0
LIBRETRO_SUPERFLAPPYBIRDS_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_SUPERFLAPPYBIRDS_CMAKE_BACKEND = ninja

LIBRETRO_SUPERFLAPPYBIRDS_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release

define LIBRETRO_SUPERFLAPPYBIRDS_INSTALL_TARGET_CMDS
	cp -r $(@D)/resources $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/superflappybirds_libretro.so $(TARGET_DIR)/usr/lib/libretro/superflappybirds_libretro.so
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/superflappybirds
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-superflappybirds/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/superflappybirds/
endef

$(eval $(cmake-package))

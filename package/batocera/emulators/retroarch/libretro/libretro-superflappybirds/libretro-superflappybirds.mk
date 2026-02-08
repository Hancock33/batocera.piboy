################################################################################
#
# libretro-superflappybirds
#
################################################################################
# Version: Commits on Apr 13, 2023
LIBRETRO_SUPERFLAPPYBIRDS_VERSION = 4b798ecc6948017ca79aad1ea20fe57e680228c8
LIBRETRO_SUPERFLAPPYBIRDS_SITE = $(call github,IgniparousTempest,libretro-superflappybirds,$(LIBRETRO_SUPERFLAPPYBIRDS_VERSION))
LIBRETRO_SUPERFLAPPYBIRDS_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_SUPERFLAPPYBIRDS_LICENSE = GPL-3.0
LIBRETRO_SUPERFLAPPYBIRDS_DEPENDENCIES = retroarch
LIBRETRO_SUPERFLAPPYBIRDS_EMULATOR_INFO = superflappybirds.libretro.core.yml
LIBRETRO_SUPERFLAPPYBIRDS_CONF_OPTS += -DUSE_OpenMP=OFF
LIBRETRO_SUPERFLAPPYBIRDS_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define LIBRETRO_SUPERFLAPPYBIRDS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/superflappybirds

	$(INSTALL) -D $(@D)/buildroot-build/superflappybirds_libretro.so $(TARGET_DIR)/usr/lib/libretro/superflappybirds_libretro.so
	cp -r  $(@D)/resources $(TARGET_DIR)/usr/lib/libretro
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-superflappybirds/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/superflappybirds/
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))

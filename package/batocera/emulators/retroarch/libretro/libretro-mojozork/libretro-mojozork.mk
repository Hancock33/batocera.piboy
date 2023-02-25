################################################################################
#
# libretro-mojozork
#
################################################################################
# Version: Commits on Feb 25, 2023
LIBRETRO_MOJOZORK_VERSION = d4487ee8a5bb27e396340d6074655cfd5b6f3676
LIBRETRO_MOJOZORK_SITE = $(call github,icculus,mojozork,$(LIBRETRO_MOJOZORK_VERSION))
LIBRETRO_MOJOZORK_LICENSE = Zlib
LIBRETRO_MOJOZORK_DEPENDENCIES = retroarch

LIBRETRO_MOJOZORK_CONF_OPTS = -DMOJOZORK_LIBRETRO=ON -DMOJOZORK_STANDALONE_DEFAULT=OFF -DMOJOZORK_MULTIZORK_DEFAULT=OFF

define LIBRETRO_MOJOZORK_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/mojozork_libretro.so   $(TARGET_DIR)/usr/lib/libretro/mojozork_libretro.so
	mkdir -p                                   $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/mojozork_libretro.info $(TARGET_DIR)/usr/share/libretro/info/mojozork_libretro.info
endef

$(eval $(cmake-package))

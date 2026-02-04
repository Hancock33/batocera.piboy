################################################################################
#
# libretro-mgba
#
################################################################################
# Version: Commits on Mar 09, 2025
LIBRETRO_MGBA_VERSION = 0.10.5
LIBRETRO_MGBA_SITE = $(call github,mgba-emu,mgba,$(LIBRETRO_MGBA_VERSION))
LIBRETRO_MGBA_LICENSE = MPLv2.0
LIBRETRO_MGBA_DEPENDENCIES = libzip libpng zlib retroarch
LIBRETRO_MGBA_EMULATOR_INFO = mgba.libretro.core.yml

LIBRETRO_MGBA_CONF_OPTS += -DBUILD_LIBRETRO=ON
LIBRETRO_MGBA_CONF_OPTS += -DSKIP_LIBRARY=ON
LIBRETRO_MGBA_CONF_OPTS += -DBUILD_QT=OFF
LIBRETRO_MGBA_CONF_OPTS += -DBUILD_SDL=OFF
LIBRETRO_MGBA_CONF_OPTS += -DUSE_DISCORD_RPC=OFF
LIBRETRO_MGBA_CONF_OPTS += -DUSE_GDB_STUB=OFF
LIBRETRO_MGBA_CONF_OPTS += -DUSE_SQLITE3=OFF
LIBRETRO_MGBA_CONF_OPTS += -DUSE_DEBUGGERS=OFF
LIBRETRO_MGBA_CONF_OPTS += -DUSE_EDITLINE=OFF
LIBRETRO_MGBA_CONF_OPTS += -DUSE_EPOXY=OFF

ifeq ($(BR2_PACKAGE_BATOCERA_GLES3),y)
    LIBRETRO_MGBA_CONF_OPTS += -DBUILD_GLES3=ON -DBUILD_GLES2=OFF
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES2),y)
    LIBRETRO_MGBA_CONF_OPTS += -DBUILD_GLES2=ON -DBUILD_GLES3=OFF
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    LIBRETRO_MGBA_CONF_OPTS += -DBUILD_GL=ON
else
    LIBRETRO_MGBA_CONF_OPTS += -DBUILD_GL=OFF
endif

define LIBRETRO_MGBA_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/mgba_libretro.so $(TARGET_DIR)/usr/lib/libretro/mgba_libretro.so
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))

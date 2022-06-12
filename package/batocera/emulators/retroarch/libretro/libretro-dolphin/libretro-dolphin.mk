################################################################################
#
# LIBRETRO DOLPHIN
#
################################################################################
# Version: Commits on Jun 12, 2022
LIBRETRO_DOLPHIN_VERSION = 68dfa100cb3f146ccde37623e562441e1cf8dc20
LIBRETRO_DOLPHIN_SITE = $(call github,libretro,dolphin,$(LIBRETRO_DOLPHIN_VERSION))
LIBRETRO_DOLPHIN_LICENSE = GPLv2

LIBRETRO_DOLPHIN_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_X11=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DLIBRETRO=ON
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_NOGUI=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_QT=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_TESTS=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DUSE_DISCORD_PRESENCE=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

# enable vulkan if we are building with it
ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
	LIBRETRO_DOLPHIN_CONF_OPTS += -DVULKAN=ON
else
	LIBRETRO_DOLPHIN_CONF_OPTS += -DVULKAN=OFF
endif

define LIBRETRO_DOLPHIN_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/buildroot-build/dolphin_libretro.so \
    $(TARGET_DIR)/usr/lib/libretro/dolphin_libretro.so
    mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/dolphin-emu
    cp -vr $(@D)/Data/Sys $(TARGET_DIR)/usr/share/batocera/datainit/bios/dolphin-emu
endef

$(eval $(cmake-package))

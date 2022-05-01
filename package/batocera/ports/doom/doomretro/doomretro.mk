################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 01, 2022
DOOMRETRO_VERSION = 84ea16988ffe7553c5fe9c6f3d9e11045c0b10ad
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

define DOOMRETRO_KEYS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/doom/doomretro/prboom.doomretro.keys $(TARGET_DIR)/usr/share/evmapy
endef

DOOMRETRO_PRE_INSTALL_TARGET_HOOKS += DOOMRETRO_KEYS

$(eval $(cmake-package))

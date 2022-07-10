################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jul 10, 2022
DOOMRETRO_VERSION = f29ee05f32bb90806733f882aba03e7d63319f6e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

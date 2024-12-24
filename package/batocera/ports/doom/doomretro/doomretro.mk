################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 24, 2024
DOOMRETRO_VERSION = d430e239ee5c323be9b6b066631089bbd691027f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 17, 2026
DOOMRETRO_VERSION = da11b4c0529e46803464f70bfdc0f70e18ad20a5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 03, 2025
DOOMRETRO_VERSION = ca58106826ff5b4a10dcc23ff0dfaa7f772a5b4b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

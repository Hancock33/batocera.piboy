################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 15, 2025
DOOMRETRO_VERSION = 8546fe09c2c53a25e311d142fcdc71b46edc62db
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

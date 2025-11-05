################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 04, 2025
DOOMRETRO_VERSION = deefe47a89f9a4432f9dd1d852d0073687f7bf39
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

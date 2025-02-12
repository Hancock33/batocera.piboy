################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 12, 2025
DOOMRETRO_VERSION = d48bc719c975980538693c8cd99c319514e3c774
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

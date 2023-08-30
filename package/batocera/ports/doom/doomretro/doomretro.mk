################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 30, 2023
DOOMRETRO_VERSION = 815008aaab5f408f10680b2b50db052e971a566e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

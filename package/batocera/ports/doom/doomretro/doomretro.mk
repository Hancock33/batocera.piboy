################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 26, 2023
DOOMRETRO_VERSION = 5583b9dac743cde6824ce0ce59d28fb7762bbab3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

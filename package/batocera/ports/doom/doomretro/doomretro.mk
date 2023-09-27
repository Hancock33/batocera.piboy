################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 27, 2023
DOOMRETRO_VERSION = 13a2cfaf68d3a1b365ec05d12bd9bbf8b086a32b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

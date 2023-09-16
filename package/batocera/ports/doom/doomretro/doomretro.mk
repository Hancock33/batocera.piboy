################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 16, 2023
DOOMRETRO_VERSION = 4e9d371679fb180730d3339bea07b3703d9acf0e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 10, 2023
DOOMRETRO_VERSION = 457512c5e01ad16c51f48491ae72bc493ba3cef3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

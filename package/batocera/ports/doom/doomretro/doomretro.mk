################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 08, 2023
DOOMRETRO_VERSION = ef93c1ebaadb05a075c458541cccf3261b92303e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

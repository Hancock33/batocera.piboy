################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 19, 2024
DOOMRETRO_VERSION = bdeeb9ecb929d816804ff7a5c6810bee24489326
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

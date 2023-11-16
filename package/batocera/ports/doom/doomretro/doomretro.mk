################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 16, 2023
DOOMRETRO_VERSION = f0272b809fe19b65ffa11f41f29b56e7e3dc066b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

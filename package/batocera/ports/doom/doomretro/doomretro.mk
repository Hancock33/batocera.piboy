################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 25, 2023
DOOMRETRO_VERSION = 5c11848fd7b70c62a7a49b9ce0fc7c0eade07fe9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

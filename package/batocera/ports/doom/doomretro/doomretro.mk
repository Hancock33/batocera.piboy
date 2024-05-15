################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 15, 2024
DOOMRETRO_VERSION = 22b58b24f6e5b2132e66bb46e4f9b7b600f7c205
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

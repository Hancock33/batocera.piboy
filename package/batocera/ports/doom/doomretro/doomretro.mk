################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 18, 2024
DOOMRETRO_VERSION = a7fae92267a12b7079186b34af795031531eb486
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

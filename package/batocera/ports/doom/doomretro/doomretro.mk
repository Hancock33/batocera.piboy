################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 24, 2024
DOOMRETRO_VERSION = bac2337c44257e01fcbd5e7c65cfc5ff53ab3cdf
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

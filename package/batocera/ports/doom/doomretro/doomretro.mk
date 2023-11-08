################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 08, 2023
DOOMRETRO_VERSION = 7baa7b575abf4c9f6857fb56215e47a1e6c8fecf
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

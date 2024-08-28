################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 28, 2024
DOOMRETRO_VERSION = c0797b0133062b5be5b82d711eb00fb1becf89c2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

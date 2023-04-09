################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 09, 2023
DOOMRETRO_VERSION = 09d8a6007bc418dc80a78bbd6b3afb24d573ce76
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

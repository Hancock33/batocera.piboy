################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 16, 2024
DOOMRETRO_VERSION = 8385c571e00aab9d89fd7a954a41adc615a2a92a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

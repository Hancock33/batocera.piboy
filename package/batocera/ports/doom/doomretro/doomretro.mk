################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 30, 2022
DOOMRETRO_VERSION = 6a4c8c03f61de15e89b590afe005f94cfe891203
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

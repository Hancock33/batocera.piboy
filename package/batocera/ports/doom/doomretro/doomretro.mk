################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 12, 2025
DOOMRETRO_VERSION = 3853f3edb9ba73b98c2c4d352fca810e788aa770
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

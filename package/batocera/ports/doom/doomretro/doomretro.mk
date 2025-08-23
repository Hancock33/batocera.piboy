################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 22, 2025
DOOMRETRO_VERSION = c939fe911632004ebfeb19ac32ddfb45c2924d7f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

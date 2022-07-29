################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 29, 2022
DOOMRETRO_VERSION = b2c172d9253283ddc65e6de44d2d1ba80910b18a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jul 22, 2022
DOOMRETRO_VERSION = f9da8cc1aecd451e984faa76aa518895981d1a03
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

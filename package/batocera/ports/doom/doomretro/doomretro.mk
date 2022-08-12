################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 12, 2022
DOOMRETRO_VERSION = 34ae1276e17cc8c8f64353296e7e548746b468e5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

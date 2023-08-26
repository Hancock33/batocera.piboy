################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 26, 2023
DOOMRETRO_VERSION = a6c3600f1c9ca71371e029f1ed4f7e71d089d02d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

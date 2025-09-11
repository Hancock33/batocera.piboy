################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 11, 2025
DOOMRETRO_VERSION = e7473484edca9940ef85152036e87aea5a642ddf
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

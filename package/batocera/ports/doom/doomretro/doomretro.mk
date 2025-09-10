################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 10, 2025
DOOMRETRO_VERSION = 1f84377bd22401df07a4e44f9066cb73a679890d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 08, 2023
DOOMRETRO_VERSION = faae70e8f41aa871a6c7c6e78dcb9ca018cba3c5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

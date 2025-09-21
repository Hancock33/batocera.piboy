################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 21, 2025
DOOMRETRO_VERSION = 2d63b9ed8a7303c09e126cc8c57beb806bb58eb1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 25, 2025
DOOMRETRO_VERSION = e48039abeb6c7257838a39de60f305b4521f119f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

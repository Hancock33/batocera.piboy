################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 09, 2023
DOOMRETRO_VERSION = 8dcd00e836e2d67268786fe58bb0e0fef74fa545
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 30, 2026
DOOMRETRO_VERSION = 5e3254706b7590278721210c344ca8845c2fde69
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

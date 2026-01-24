################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 24, 2026
DOOMRETRO_VERSION = af52dda2a896978cedaa3f33c1f88ecde672cc06
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

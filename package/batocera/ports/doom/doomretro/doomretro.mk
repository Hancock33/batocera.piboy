################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 19, 2024
DOOMRETRO_VERSION = d0d33162fa49719a713aefdbc0959148197e40ef
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 23, 2026
DOOMRETRO_VERSION = 336bd922e502e03a83b16547fa821e3bddffa3a9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

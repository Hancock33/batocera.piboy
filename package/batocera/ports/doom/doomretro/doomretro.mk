################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 21, 2026
DOOMRETRO_VERSION = c419d5e1c37d186fe92736c154716325142eab67
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

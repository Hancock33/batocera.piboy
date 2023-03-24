################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 24, 2023
DOOMRETRO_VERSION = 4b2270fc0f901129b6606ce69465fee76c7036aa
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

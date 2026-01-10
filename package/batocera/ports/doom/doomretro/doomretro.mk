################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 10, 2026
DOOMRETRO_VERSION = 5db6ef0984876f75b4dd3cde5a237393ea4cd073
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

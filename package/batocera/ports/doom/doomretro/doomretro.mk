################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 26, 2022
DOOMRETRO_VERSION = 7e0692c74976edf91b648c90773fc9fe40d08473
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

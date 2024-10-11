################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 11, 2024
DOOMRETRO_VERSION = f62d8c670bded1a56d4c3c6f2505d7a629330404
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 16, 2024
DOOMRETRO_VERSION = 9e775756988eb8fc3c5b0080a3fa25fb10924fab
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

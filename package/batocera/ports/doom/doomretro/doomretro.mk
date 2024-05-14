################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 14, 2024
DOOMRETRO_VERSION = 0915060d448b93049a19ceb120c66ae84301be34
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 20, 2022
DOOMRETRO_VERSION = 33a16e9eea67e28b4c821d8b740bf8aca89b9b64
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

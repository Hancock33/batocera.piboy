################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 15, 2022
DOOMRETRO_VERSION = 4f55f648e33a67e60aa4dda5e64d0c260bb5fe06
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

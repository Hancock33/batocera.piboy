################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 25, 2024
DOOMRETRO_VERSION = 2226db89adf190de1ad4fedf8586b0d0fc468186
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

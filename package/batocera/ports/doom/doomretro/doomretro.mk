################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 02, 2024
DOOMRETRO_VERSION = 5a3aac6312e753942fdca052bd80cccd22f5eca0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

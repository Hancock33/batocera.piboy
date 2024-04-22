################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 22, 2024
DOOMRETRO_VERSION = d5c217b12c7cf1c5ebf8e0f74cb7c548e3d29517
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

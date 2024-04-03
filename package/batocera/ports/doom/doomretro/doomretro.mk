################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 03, 2024
DOOMRETRO_VERSION = a831c3e7c3e9ac7f042b97e5376d5e924df0f0d4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

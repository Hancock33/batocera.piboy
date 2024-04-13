################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 13, 2024
DOOMRETRO_VERSION = 84c60bf5021fa22f4d9c1341ce6618d6b313e82f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

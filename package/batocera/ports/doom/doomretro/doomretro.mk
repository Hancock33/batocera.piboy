################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 13, 2022
DOOMRETRO_VERSION = c08b589336fbed4de3f47f6daef1c5d039130706
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

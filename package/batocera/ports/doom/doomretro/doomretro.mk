################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 31, 2024
DOOMRETRO_VERSION = 2f2e4e727760fdef8cb933cdff0268ff31244488
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

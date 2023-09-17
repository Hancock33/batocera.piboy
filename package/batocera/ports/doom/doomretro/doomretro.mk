################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 17, 2023
DOOMRETRO_VERSION = b564b98dbb8003e060206dd63f395dc4dc81f8f9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

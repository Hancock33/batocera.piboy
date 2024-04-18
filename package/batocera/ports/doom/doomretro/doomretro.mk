################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 18, 2024
DOOMRETRO_VERSION = da00ed93c707e9411bcf9e69210ecaa87b870653
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

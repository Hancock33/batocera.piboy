################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 24, 2024
DOOMRETRO_VERSION = c4c65e9ef612a6649144c6bb3c18e8cec65bb36c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 04, 2025
DOOMRETRO_VERSION = 76c26a9c7a4e0a3f43a77131c8d6ee7f301d43f8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

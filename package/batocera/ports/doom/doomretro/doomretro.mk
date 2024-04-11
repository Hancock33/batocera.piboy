################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 11, 2024
DOOMRETRO_VERSION = 0b9388adab7dbd8b2fd1af9baa2da35cd82ccef2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

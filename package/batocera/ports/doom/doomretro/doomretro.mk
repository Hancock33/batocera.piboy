################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 10, 2024
DOOMRETRO_VERSION = 57f476f2d4151337ca4bb64abb606d5e88e7d124
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

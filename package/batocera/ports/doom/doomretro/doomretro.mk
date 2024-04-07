################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 07, 2024
DOOMRETRO_VERSION = 3f7b336f99d431ab1de2757ec635d7098e4ccadb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

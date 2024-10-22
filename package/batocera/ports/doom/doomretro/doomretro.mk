################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 22, 2024
DOOMRETRO_VERSION = 55eda892813c6f5cfe45f0481d8c531037726519
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

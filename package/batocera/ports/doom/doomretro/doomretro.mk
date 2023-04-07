################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 07, 2023
DOOMRETRO_VERSION = 62fc9a961499112e3ef7f1a97a2ca51f9f6b346c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

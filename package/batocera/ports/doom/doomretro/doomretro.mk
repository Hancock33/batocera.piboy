################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 30, 2024
DOOMRETRO_VERSION = 4e54728c56e34e37bdd8ea27ad0d161af2002fce
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

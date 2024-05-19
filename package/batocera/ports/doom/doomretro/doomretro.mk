################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 19, 2024
DOOMRETRO_VERSION = f85962b5e058490dde9af6677452ba442e28f558
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

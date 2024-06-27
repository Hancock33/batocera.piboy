################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 27, 2024
DOOMRETRO_VERSION = af3a3488d03bf0dc5c072cd0f019a9fdf8bef5a3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

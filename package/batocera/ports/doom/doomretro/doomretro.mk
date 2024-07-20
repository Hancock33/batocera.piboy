################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 20, 2024
DOOMRETRO_VERSION = c59e931c8464fdd83609076fe0bb033edca99cb9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

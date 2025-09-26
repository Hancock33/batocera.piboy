################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 26, 2025
DOOMRETRO_VERSION = acad6d0635a8d98efe8ade235fc177f514c00ca3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

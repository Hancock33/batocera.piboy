################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 08, 2025
DOOMRETRO_VERSION = ce91b89d43e454681e4919c0888379de236e71e6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

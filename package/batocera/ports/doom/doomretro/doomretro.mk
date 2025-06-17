################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 17, 2025
DOOMRETRO_VERSION = 8a1a7f8ecb929ce026575a34f6b20dd631ed4e98
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

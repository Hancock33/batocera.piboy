################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 31, 2024
DOOMRETRO_VERSION = 307322d7cc3c6827c6fb78c52b69cc75197cf3f9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 02, 2022
DOOMRETRO_VERSION = 902f9cc3ddfa9bbcc726ca5cbd1c4b4c88676796
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

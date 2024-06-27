################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 27, 2024
DOOMRETRO_VERSION = ba8c9f9532dd2440937227bd09f2784cf77f6937
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

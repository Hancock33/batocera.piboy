################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 04, 2025
DOOMRETRO_VERSION = 0c04cc869c087097dda55749bd09fc9e6b0ef48f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

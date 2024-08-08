################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 08, 2024
DOOMRETRO_VERSION = c464d201db5b67f558edc4e7d98da1189fc516ed
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

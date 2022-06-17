################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jun 17, 2022
DOOMRETRO_VERSION = d68666d0c4a0cebc5e525a59eb79a52a2c54e71e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 19, 2025
DOOMRETRO_VERSION = 0dc485bf86400b277ca7783c97d578b15c5cc400
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

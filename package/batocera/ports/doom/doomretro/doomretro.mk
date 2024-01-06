################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 06, 2024
DOOMRETRO_VERSION = e2b1bae86ba52c514dcf40c4113363e997414a40
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

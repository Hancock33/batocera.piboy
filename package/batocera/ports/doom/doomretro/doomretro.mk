################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 12, 2023
DOOMRETRO_VERSION = 02ff81a43bab851fae28ec3a7f940a4630042d32
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

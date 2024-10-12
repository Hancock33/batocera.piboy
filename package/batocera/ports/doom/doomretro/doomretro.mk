################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 12, 2024
DOOMRETRO_VERSION = 66a99f8431fb356987777171ce1647692f9847a1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

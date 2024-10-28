################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 28, 2024
DOOMRETRO_VERSION = a2bf7163dd99f5d3e1bb64db850a2ca22c544dcf
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

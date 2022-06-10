################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jun 10, 2022
DOOMRETRO_VERSION = 28c898c4d3c8065b503b01bccce16939b53db8be
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

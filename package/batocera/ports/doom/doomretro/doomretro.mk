################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 30, 2024
DOOMRETRO_VERSION = 7ea6b9034a197790a769fad6d3a8d8b1253526cd
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

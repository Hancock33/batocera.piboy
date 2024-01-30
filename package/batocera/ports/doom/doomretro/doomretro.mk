################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 30, 2024
DOOMRETRO_VERSION = 08674f31830a18cdf653c6e3f9477a31040d110b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

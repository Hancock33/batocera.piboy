################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 29, 2023
DOOMRETRO_VERSION = b2938ac73cc737456fea1171ffa505da083588d9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

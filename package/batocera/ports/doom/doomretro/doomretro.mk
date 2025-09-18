################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 18, 2025
DOOMRETRO_VERSION = ad9ae43df728f11257a1f729f2d0e26c96c7dceb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

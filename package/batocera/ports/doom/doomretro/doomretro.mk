################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 27, 2025
DOOMRETRO_VERSION = d2e5f3856f50d99aaf46502988417fcfccd8672a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

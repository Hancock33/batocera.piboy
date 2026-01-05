################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 05, 2026
DOOMRETRO_VERSION = 4734d883caee5cc2dcc77e675078c69e6a7cb95c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

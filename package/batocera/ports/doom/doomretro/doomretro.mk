################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 31, 2026
DOOMRETRO_VERSION = be3c3788cf7fa2470c40b915561a9f16d7ab2a9a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

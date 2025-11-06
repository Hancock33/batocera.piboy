################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 06, 2025
DOOMRETRO_VERSION = 581637955b37661612b4ca3841653d5888ffc43e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

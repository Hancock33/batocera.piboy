################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 29, 2025
DOOMRETRO_VERSION = 284176c9f83f471f919ae11cafa17766a3451866
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

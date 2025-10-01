################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 01, 2025
DOOMRETRO_VERSION = eb760ea9d244385b0c17e581d8e8ac5446d65f45
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

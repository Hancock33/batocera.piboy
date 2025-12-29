################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 29, 2025
DOOMRETRO_VERSION = d37ed1efe229b818dd2709a680ce80cfc3f99fbf
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

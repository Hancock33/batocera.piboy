################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 01, 2025
DOOMRETRO_VERSION = 32ea94f119cb3361daf437943c52adc29e17b3a9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

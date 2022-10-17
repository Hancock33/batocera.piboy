################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 17, 2022
DOOMRETRO_VERSION = eeea8709f6dcf79e6a1e9cf55ca5dc2a75cca3a7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

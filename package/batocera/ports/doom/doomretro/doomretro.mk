################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 22, 2025
DOOMRETRO_VERSION = 6897e3267469acc5a392da9009ce0ffe8d4d4881
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

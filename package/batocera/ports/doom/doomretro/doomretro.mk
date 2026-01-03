################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 03, 2026
DOOMRETRO_VERSION = 5805e07b54b433f8db1ce35079b30c9f1f0bef64
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

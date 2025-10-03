################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 03, 2025
DOOMRETRO_VERSION = 0576b21a87531a73b229d4aa4361036e7829a6ed
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

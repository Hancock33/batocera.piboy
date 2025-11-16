################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 16, 2025
DOOMRETRO_VERSION = 0182de1b29cae6dbcc67366f9326f63510b7635b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

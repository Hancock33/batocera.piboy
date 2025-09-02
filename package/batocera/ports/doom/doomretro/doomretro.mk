################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 02, 2025
DOOMRETRO_VERSION = d800779ed26430f155a635f9d583741355855b60
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

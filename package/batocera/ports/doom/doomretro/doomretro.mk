################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 01, 2024
DOOMRETRO_VERSION = 971370af08031d45e6476cc679ae8758333584a6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

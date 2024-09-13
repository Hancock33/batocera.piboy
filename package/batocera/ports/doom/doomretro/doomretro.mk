################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 13, 2024
DOOMRETRO_VERSION = ef038b37b3a08a942f7e583de55e2df7984554ad
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

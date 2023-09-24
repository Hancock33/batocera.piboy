################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 24, 2023
DOOMRETRO_VERSION = 2e2bac23ce21779947369ee67cc63b1c78814c70
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

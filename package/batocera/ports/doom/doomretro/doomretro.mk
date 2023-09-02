################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 02, 2023
DOOMRETRO_VERSION = 4c6b06d01968c9dbb2f56b7fa220a1040bc85a7e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

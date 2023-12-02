################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 02, 2023
DOOMRETRO_VERSION = 2c8220c09d0ec8f58c10a36d7a13b8f6e690c6a1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 01, 2023
DOOMRETRO_VERSION = 29ddbc869301340b68266747a72a6b3fcbf543f8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

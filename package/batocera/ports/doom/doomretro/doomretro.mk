################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 18, 2023
DOOMRETRO_VERSION = 636f657a755443953a15c3bea5b1a891ce258852
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 05, 2023
DOOMRETRO_VERSION = 9849feb4f6eb89d7510546c0c752bb120764ea01
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

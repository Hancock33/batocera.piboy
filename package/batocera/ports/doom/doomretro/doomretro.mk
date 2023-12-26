################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 26, 2023
DOOMRETRO_VERSION = dfbb107b640fac3f3f28be42a26b10331aede6fc
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

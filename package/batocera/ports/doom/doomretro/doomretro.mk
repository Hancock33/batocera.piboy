################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 22, 2023
DOOMRETRO_VERSION = 04ff1f03de6ae010add72777e749a79b84e9bd20
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

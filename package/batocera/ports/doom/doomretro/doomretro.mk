################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 06, 2024
DOOMRETRO_VERSION = 3592df50f02f337c1840ccd485f8f6e825998862
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

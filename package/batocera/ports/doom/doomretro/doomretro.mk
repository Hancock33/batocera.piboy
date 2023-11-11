################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 11, 2023
DOOMRETRO_VERSION = ea3b30e5d2ae93547680c4fa1ab2529b06721a27
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

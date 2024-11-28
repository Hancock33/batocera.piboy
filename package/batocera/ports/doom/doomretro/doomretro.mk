################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 28, 2024
DOOMRETRO_VERSION = 784f9e2dcfacb80d2a48e19edd8802d723321d50
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

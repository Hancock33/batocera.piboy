################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 22, 2022
DOOMRETRO_VERSION = 3db43f887e80266ec70ca8f35f33cc6551d734d9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 21, 2022
DOOMRETRO_VERSION = e536cf9f288fefe1ec93883234aa11962d924d45
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 27, 2022
DOOMRETRO_VERSION = aa1b0beaa291204b21e00268bd2b14fde7db6cae
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

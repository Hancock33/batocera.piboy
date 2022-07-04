################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jul 04, 2022
DOOMRETRO_VERSION = e3d51a3a9d0dbb8a19fd183ef1ba9d5e44d047fb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

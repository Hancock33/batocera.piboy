################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 01, 2022
DOOMRETRO_VERSION = 1df1c6dd4236230f27a9ddbdc15238675bec8175
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

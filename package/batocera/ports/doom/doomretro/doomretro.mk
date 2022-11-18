################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 18, 2022
DOOMRETRO_VERSION = 0f1073955263b95f0e0478341b820516cb80726f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

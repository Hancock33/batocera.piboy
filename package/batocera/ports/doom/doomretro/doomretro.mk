################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 04, 2022
DOOMRETRO_VERSION = 0d90930d918172b71ccbed00d33fd601dc44b9fd
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

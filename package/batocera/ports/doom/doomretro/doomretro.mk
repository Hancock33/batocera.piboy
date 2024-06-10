################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 10, 2024
DOOMRETRO_VERSION = 8ae4d6320dd98cc82dc403fe53f93c9c2ab1feea
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

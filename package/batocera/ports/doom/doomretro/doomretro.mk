################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 26, 2022
DOOMRETRO_VERSION = 882f516a9797ce42eb3bb5b3030a5707eb8bcf36
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

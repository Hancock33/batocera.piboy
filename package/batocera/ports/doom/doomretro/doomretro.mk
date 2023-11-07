################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 07, 2023
DOOMRETRO_VERSION = 6533b782f16acb71a554e326d6b18ae1a380bbbd
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

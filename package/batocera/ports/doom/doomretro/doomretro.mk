################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 24, 2022
DOOMRETRO_VERSION = 89c7f135d99379160027f0058027262c64cd812c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

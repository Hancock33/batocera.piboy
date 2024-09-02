################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 02, 2024
DOOMRETRO_VERSION = b1121d5f844f5e947ec8bf9d8ca7489b64fdb153
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

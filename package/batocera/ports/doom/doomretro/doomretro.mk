################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 26, 2024
DOOMRETRO_VERSION = 70f7c9d8b49fd0d4895442e1230a22d93e588a96
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

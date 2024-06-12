################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 12, 2024
DOOMRETRO_VERSION = 525aaa6a1448485d0b7a6b07cf7315d2c396ba0d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

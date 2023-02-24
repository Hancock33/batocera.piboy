################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 24, 2023
DOOMRETRO_VERSION = 8e8c0ba97b7639816c78d815fcaf26ab102438c5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

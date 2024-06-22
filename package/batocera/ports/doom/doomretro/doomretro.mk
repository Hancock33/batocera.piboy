################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 22, 2024
DOOMRETRO_VERSION = 0b55e44ff4b966603e6500a0a242286160f3c7ed
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

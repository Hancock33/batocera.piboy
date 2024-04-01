################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 01, 2024
DOOMRETRO_VERSION = 79d45ee187813b7c2ab60f4a2efc4898e51792d5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

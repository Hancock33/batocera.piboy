################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 26, 2024
DOOMRETRO_VERSION = e9bea4cac37154047b5f6d71e8af2bf5f82f942c
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

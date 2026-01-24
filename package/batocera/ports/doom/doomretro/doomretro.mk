################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 24, 2026
DOOMRETRO_VERSION = 1f01f08ea843f882212d51d8b3818991cd7f3df1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

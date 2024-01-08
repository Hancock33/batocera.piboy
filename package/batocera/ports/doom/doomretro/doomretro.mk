################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 08, 2024
DOOMRETRO_VERSION = 58cb4f2588918f05adcb6609bae53e2a2b336f93
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

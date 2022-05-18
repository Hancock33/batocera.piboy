################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on May 18, 2022
DOOMRETRO_VERSION = c9aa37b9979a9313970ee9e634c6438cc56751a0
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

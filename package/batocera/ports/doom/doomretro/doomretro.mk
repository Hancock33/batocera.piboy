################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 24, 2024
DOOMRETRO_VERSION = fc11fd82d68b3582ad8e293ecaa4876c334b6732
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

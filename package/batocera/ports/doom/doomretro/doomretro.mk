################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 12, 2023
DOOMRETRO_VERSION = 6e84600eaf3a1a7ca652bd8de12e0203410480a4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

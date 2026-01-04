################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 04, 2026
DOOMRETRO_VERSION = ac400e65a2600b8cea0a9d447a824a584a278904
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

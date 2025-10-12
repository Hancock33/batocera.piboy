################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 12, 2025
DOOMRETRO_VERSION = 6c99b05fdaac67c6078f33a5d2527fc6d479df70
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

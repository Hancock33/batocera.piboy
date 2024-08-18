################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 18, 2024
DOOMRETRO_VERSION = 27bfe27dc8c493cd6a16f58fbf08ed9d28377a69
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 21, 2023
DOOMRETRO_VERSION = 8ceb4da84e08fb648c418796540d0952f3eb4fa8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

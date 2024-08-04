################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 04, 2024
DOOMRETRO_VERSION = a034b7b843c53ee56697d8fda603096b41c1f3fb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

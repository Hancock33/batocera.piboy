################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 17, 2025
DOOMRETRO_VERSION = 34d302bdfee2b169badf3661103c4eeec6875161
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 21, 2025
DOOMRETRO_VERSION = c496f7123fc552ac413011e584fdc7543f44437d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

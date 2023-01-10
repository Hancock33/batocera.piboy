################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 10, 2023
DOOMRETRO_VERSION = ea01d3fbaada6453b68530889060186d888c291d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

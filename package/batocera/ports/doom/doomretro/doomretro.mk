################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 28, 2024
DOOMRETRO_VERSION = 8e13df477a49145ccf7afec239367c0c87ed91d3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

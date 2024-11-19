################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 19, 2024
DOOMRETRO_VERSION = f0db09948c87bd473f81de1871728bcd43437b79
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

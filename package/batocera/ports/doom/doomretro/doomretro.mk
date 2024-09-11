################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 11, 2024
DOOMRETRO_VERSION = 8c3f03c956a2529ee90ea4bfa85811d0db1609f7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

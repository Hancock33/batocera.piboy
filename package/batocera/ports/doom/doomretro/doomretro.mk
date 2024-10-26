################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 25, 2024
DOOMRETRO_VERSION = bcd63b28a79bab3da66de85f242e4fc404978c01
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

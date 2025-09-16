################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 16, 2025
DOOMRETRO_VERSION = 863ce4293c24da0b2ee35f65f93e0bfec3b32969
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

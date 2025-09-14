################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 14, 2025
DOOMRETRO_VERSION = d163a3594815d36d0d02dd4b3fe5518aec10b59f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 03, 2025
DOOMRETRO_VERSION = f0d10dcdf9b050af4c1abd082d12de4c2e7593d1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

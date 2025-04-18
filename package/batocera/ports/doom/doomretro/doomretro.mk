################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 18, 2025
DOOMRETRO_VERSION = f18d422e208670bd86c7fcafaf2bdbc6a7327275
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

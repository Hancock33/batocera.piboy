################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 03, 2025
DOOMRETRO_VERSION = 9756f79c51b023f707451b86a236e9c1af647d70
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

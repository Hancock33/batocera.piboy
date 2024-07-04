################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 04, 2024
DOOMRETRO_VERSION = 228d463d2383319ddb3df6ceaf6fce715a81c547
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

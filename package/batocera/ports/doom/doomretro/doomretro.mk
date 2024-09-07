################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 07, 2024
DOOMRETRO_VERSION = 6e359e520d27f9ff7205d8449c3c5108d5609da9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

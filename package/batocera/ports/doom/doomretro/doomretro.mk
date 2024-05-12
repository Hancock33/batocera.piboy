################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 12, 2024
DOOMRETRO_VERSION = 19bc39ae4966480ec2b643e8c1b01cf22eaf03fe
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 11, 2024
DOOMRETRO_VERSION = 83a389300682997592d2293ec2fdd5dd0b3d11f7
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

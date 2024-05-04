################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on May 04, 2024
DOOMRETRO_VERSION = b852aa656c7288a6fbe6ec2584dc4d0c81a1023f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 15, 2023
DOOMRETRO_VERSION = bded616f6226cc7dad5e711fdb9236d832bacdcd
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

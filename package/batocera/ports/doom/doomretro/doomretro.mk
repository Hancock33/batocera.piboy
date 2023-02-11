################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 11, 2023
DOOMRETRO_VERSION = e210fdccca7986d5cf27d78a93152f1a85b28d83
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

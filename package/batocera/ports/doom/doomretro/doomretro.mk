################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 27, 2024
DOOMRETRO_VERSION = ec57f9d700f966acb71090b730ccb0d0b369efad
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

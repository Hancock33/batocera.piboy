################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 25, 2024
DOOMRETRO_VERSION = 366d50525ccda5a4baf0af0cf21dbde6af220b45
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

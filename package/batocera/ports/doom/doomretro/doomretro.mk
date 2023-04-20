################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 20, 2023
DOOMRETRO_VERSION = d571a95ff76a8240b1b6422d55185c9e956a7c7b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

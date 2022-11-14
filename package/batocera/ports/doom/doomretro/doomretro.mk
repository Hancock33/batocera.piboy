################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 14, 2022
DOOMRETRO_VERSION = c591d672df6529aebfb345e47131b146f6525ec6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

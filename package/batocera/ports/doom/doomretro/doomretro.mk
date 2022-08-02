################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 02, 2022
DOOMRETRO_VERSION = 960fbcccb161a43bf4276fd1a07f0b480b1d51ce
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

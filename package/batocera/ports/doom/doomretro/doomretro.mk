################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 28, 2024
DOOMRETRO_VERSION = e4af9bfe0fa40b55ba409236c468d06a2296e864
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

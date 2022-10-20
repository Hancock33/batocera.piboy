################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 20, 2022
DOOMRETRO_VERSION = 0efa57613ae232110bdba810f0e30b990cc03c91
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

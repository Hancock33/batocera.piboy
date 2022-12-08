################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 08, 2022
DOOMRETRO_VERSION = 010e97bb8b90bc989eedadfa60749dcbe894938a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

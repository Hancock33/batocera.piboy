################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 13, 2024
DOOMRETRO_VERSION = daa2cc2dfc59de9311cbb787440458cd01956b24
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

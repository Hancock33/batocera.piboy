################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 22, 2022
DOOMRETRO_VERSION = 79b04270152e194c37403cb2177dff951bd387ea
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

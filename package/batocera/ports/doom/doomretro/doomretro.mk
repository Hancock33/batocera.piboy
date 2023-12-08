################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 08, 2023
DOOMRETRO_VERSION = 860ab53552c1a8fb507d56850930ae23cb97d70f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

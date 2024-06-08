################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 08, 2024
DOOMRETRO_VERSION = a1e8b9173955143ee0814f0921923e7c1dcee4a3
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 08, 2024
DOOMRETRO_VERSION = f760ba436303711a627ec57f46ee7255496d1633
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

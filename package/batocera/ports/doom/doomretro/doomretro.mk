################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 26, 2024
DOOMRETRO_VERSION = aef1e6dc33b636ad4622dee2a9009d9ba4ce1a4d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

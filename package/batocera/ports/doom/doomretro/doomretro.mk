################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Apr 10, 2023
DOOMRETRO_VERSION = f8f300fcab37f104c78f45200726ea6363c021e9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

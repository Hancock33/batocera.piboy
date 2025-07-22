################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 22, 2025
DOOMRETRO_VERSION = f11d18cdc5597abee60ef7cfee5dbef0a6b05694
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

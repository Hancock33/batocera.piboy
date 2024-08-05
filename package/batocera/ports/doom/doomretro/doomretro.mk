################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 05, 2024
DOOMRETRO_VERSION = 6a191f2027095ffa4349142213f59a3a16c22561
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

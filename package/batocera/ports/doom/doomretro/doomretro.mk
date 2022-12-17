################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 17, 2022
DOOMRETRO_VERSION = 4f1ae781d7fbb4e67506eaadab130efa36656f72
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

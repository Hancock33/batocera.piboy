################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 25, 2025
DOOMRETRO_VERSION = 65f702c936cc791b8663fcc95998123d461b5adb
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

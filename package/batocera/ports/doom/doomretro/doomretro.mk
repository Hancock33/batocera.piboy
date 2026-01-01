################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 01, 2026
DOOMRETRO_VERSION = 5ec9d4e4e8f3e259c8a973da317d93427ad48a2f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

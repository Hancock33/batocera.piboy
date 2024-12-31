################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 31, 2024
DOOMRETRO_VERSION = d933536085c13cde90e3affb8cf5e5eaf1280cb4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

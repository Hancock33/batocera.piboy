################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 08, 2022
DOOMRETRO_VERSION = 553dc9bbce4e015c17fabce2d15afa4984f18d7e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 03, 2024
DOOMRETRO_VERSION = c57575cced41b55b6c594bbce8cc0887ad039fe1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

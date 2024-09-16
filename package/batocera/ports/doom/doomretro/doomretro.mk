################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 16, 2024
DOOMRETRO_VERSION = ca3edfeb1861a09325bec35466677939cd38ed4d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 21, 2024
DOOMRETRO_VERSION = 524aabe9640f5efc201250eceabe4f9ec52f60e8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

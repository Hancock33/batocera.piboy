################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 25, 2023
DOOMRETRO_VERSION = 007bb5c632115d4f50ab63600bcea5589028ef28
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

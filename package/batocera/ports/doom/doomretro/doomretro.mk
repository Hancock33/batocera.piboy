################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 13, 2024
DOOMRETRO_VERSION = b389035ce9bb3b00dfea774757bcae0b7c4066d1
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

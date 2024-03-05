################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 05, 2024
DOOMRETRO_VERSION = 77b54d346ad29e0f2394c26f32954cc51effed8b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

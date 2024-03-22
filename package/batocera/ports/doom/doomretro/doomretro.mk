################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 22, 2024
DOOMRETRO_VERSION = 66389615a4568a2896dd8013ce8146f00f1bac32
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

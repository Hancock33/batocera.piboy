################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 18, 2023
DOOMRETRO_VERSION = 5261c1afcbd8ef2771695f94a54a9e7e8af5854f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

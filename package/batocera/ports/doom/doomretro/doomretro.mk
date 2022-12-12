################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Dec 12, 2022
DOOMRETRO_VERSION = 5aa3be7f11e32d76f57d6403940cf38220b7bd50
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

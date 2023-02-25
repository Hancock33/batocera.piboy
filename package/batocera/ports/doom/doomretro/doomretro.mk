################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 25, 2023
DOOMRETRO_VERSION = b93bcc62c47ee063c0ebad85d6658d40d8ab4f0a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

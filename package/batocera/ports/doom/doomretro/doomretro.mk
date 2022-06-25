################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jun 25, 2022
DOOMRETRO_VERSION = b398b3659bca1754ab314bfe3599014830292b72
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

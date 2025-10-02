################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 02, 2025
DOOMRETRO_VERSION = 22db4535c45e013cdf496d20a851269a52926583
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

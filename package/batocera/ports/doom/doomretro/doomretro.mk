################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 02, 2025
DOOMRETRO_VERSION = 7f545886017aeb1c2202b34322f0fe082cd23fe6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 25, 2025
DOOMRETRO_VERSION = 5437e188b6354e3f3bc561a42a7f2db8663b21ce
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

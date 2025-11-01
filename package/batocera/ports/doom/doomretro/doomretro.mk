################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Nov 01, 2025
DOOMRETRO_VERSION = c701ec0c85da1158771fe92a86075ddc8bc32e09
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

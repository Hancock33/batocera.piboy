################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 05, 2022
DOOMRETRO_VERSION = a45b8c586b127a4fc503936fd411315a9a1ea3e6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 24, 2022
DOOMRETRO_VERSION = b108dc9bcba80a68dd90f88d4b69f6ee11f11ea8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

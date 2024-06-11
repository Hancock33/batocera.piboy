################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 11, 2024
DOOMRETRO_VERSION = e831191621a6e9f16a5b91d94d704f9ac624a011
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

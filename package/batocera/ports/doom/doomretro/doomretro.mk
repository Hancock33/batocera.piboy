################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 07, 2024
DOOMRETRO_VERSION = d71e1f7ccad23e5870300a1e7a487853a050e3ac
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

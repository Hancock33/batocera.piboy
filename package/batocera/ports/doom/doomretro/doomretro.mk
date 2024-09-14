################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 14, 2024
DOOMRETRO_VERSION = 82a7c8600b691737ef434eb29140ab73c225fa29
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

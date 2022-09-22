################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 22, 2022
DOOMRETRO_VERSION = 031ee968e2abcc8c5ba632399170740512c2437f
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

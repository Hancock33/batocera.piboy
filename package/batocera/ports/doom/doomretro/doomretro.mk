################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Aug 16, 2024
DOOMRETRO_VERSION = 2dc6b36dd8c7116c7698b3879dd3a662032b534a
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

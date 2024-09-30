################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 30, 2024
DOOMRETRO_VERSION = 3b51088bf7bc05192dc0b8fbfe4c409e8a458ad4
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 02, 2024
DOOMRETRO_VERSION = 5bd7422a93cfab26fe127152b61fef2e74840aff
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

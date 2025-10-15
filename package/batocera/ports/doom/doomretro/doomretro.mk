################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 15, 2025
DOOMRETRO_VERSION = 182262857e4f85cfa6b4ea451fbf67ab41b03b23
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

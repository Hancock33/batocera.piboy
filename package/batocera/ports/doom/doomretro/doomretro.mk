################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 27, 2025
DOOMRETRO_VERSION = ffe7d5ea1521233f89088611a7c831394b008f10
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

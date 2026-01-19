################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 19, 2026
DOOMRETRO_VERSION = 299bd601217ff1e8471e64fab923f6106616730b
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 09, 2026
DOOMRETRO_VERSION = 2fa03283dbcf4c6ba868200b15dde9426cf7b2c6
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

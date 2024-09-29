################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 29, 2024
DOOMRETRO_VERSION = 30fa32bfc2b78f3a35614060533f1dce43e6e22d
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 28, 2025
DOOMRETRO_VERSION = e99cab9580bbd3f5914f244c9db32c71843c92e8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

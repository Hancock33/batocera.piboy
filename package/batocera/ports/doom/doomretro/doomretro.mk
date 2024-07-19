################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jul 19, 2024
DOOMRETRO_VERSION = a5e5406a76b31e93a877b51aaff4258a47ef9674
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

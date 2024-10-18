################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 18, 2024
DOOMRETRO_VERSION = aa94898f20439140d9bf5e55730dbc93394f94fa
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

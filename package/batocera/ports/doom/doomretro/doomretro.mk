################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 30, 2023
DOOMRETRO_VERSION = 4e31b61e94445c9612755cb8d879e64fd6b14cfc
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

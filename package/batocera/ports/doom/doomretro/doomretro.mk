################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 18, 2023
DOOMRETRO_VERSION = 722e9509e91cf3e87a96322b31324b9db5161500
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

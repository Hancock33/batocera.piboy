################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Mar 09, 2024
DOOMRETRO_VERSION = 687076196c9359c365433ccef77894106071d309
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

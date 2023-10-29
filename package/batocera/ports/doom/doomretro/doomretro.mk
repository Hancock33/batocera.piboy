################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 29, 2023
DOOMRETRO_VERSION = 6050d93eea2a2b49196b948e2827bacd6d875c74
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

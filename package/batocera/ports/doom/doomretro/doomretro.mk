################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 15, 2023
DOOMRETRO_VERSION = fd59aaf54b4a398cea893e261289ae89b00c83d2
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

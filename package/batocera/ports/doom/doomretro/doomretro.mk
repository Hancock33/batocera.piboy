################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 15, 2023
DOOMRETRO_VERSION = 517ada8b16cc31f1b2ac55efe95418dc170117ca
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

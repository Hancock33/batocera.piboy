################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Oct 10, 2023
DOOMRETRO_VERSION = e20fd2c3870285745efca903b5fdef57982820de
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))

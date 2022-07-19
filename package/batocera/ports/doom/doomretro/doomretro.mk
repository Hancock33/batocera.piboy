################################################################################
#
# DOOMRETRO
#
################################################################################
# Version: Commits on Jul 19, 2022
DOOMRETRO_VERSION = ac0ceef6b35451b05ef50aaf8df0e530175cf1d8
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jun 28, 2024
DOOMRETRO_VERSION = db2d74675311cc8b078afb5a966cf0af2210fea5
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

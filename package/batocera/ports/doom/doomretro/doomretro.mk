################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Sept 01, 2024
DOOMRETRO_VERSION = 9a805389d4f4253b8d76094ee846a4db564e1ec9
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Feb 01, 2026
DOOMRETRO_VERSION = d93afd5a8ead497895c67acf095a010bdefdd535
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))

################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 10, 2024
FHEROES2_VERSION = 78acf2e7caa123c7c1add444c1759f62f5296e9d
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

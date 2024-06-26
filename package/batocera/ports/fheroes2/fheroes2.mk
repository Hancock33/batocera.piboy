################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jun 26, 2024
FHEROES2_VERSION = f29b0ced45d9469e9e4c3d0acde021b4d1c88ce1
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

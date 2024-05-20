################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 20, 2024
FHEROES2_VERSION = 608234b0a9a3d45c3c2d807a7baf74ab3079c1d9
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

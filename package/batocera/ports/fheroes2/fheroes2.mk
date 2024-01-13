################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 13, 2024
FHEROES2_VERSION = d0a3d3085debac1df4f2d6619a13a630cce33be3
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

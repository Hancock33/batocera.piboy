################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 21, 2024
FHEROES2_VERSION = 587272d60b17a13d1f3358fccbadcfe2dd56f578
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

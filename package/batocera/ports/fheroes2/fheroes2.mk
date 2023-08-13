################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 13, 2023
FHEROES2_VERSION = 8f122f988101e5b53e454f408b939cbd2f10184a
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

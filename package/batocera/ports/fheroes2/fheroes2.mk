################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 07, 2024
FHEROES2_VERSION = 0124675370010640828b2947bae0b62ff09b7e1e
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

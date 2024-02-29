################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Feb 28, 2024
FHEROES2_VERSION = cbe1879c023bbc89b14120c44be0ef92040c972c
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

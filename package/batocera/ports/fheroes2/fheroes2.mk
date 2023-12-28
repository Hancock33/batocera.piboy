################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Dec 28, 2023
FHEROES2_VERSION = 498e2904f64f64b68b9b9074f1c40a7c197a9a03
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

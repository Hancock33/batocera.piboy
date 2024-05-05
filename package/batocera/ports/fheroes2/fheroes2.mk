################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on May 05, 2024
FHEROES2_VERSION = e626765bffbf1900cfa94415487f512495bb2cca
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

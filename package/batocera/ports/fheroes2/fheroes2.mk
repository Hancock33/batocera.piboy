################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 06, 2023
FHEROES2_VERSION = e1bf008cc0c1103224ff3eb12ba05e7ee0eed27c
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

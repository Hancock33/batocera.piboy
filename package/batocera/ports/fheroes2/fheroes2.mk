################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Sept 13, 2023
FHEROES2_VERSION = 871453d3b97495c2176422871b903dabc22acd5e
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

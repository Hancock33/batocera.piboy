################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Aug 31, 2023
FHEROES2_VERSION = 7cc524f390e83f501196b5d3e1d35b18f83b105b
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

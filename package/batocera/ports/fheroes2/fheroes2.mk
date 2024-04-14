################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Apr 13, 2024
FHEROES2_VERSION = 9422f53c554c843d1d3fbecb3247f56189fa7ca2
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

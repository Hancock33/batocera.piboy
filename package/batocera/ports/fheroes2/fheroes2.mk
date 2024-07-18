################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jul 18, 2024
FHEROES2_VERSION = dfeb7fdc05b0e582a396f3029b29ff5f8421c4ee
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Jan 13, 2024
FHEROES2_VERSION = 3a1b1759472d737a4e370d5859c7c8ce63841b5b
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))

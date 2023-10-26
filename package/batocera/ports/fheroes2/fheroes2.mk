################################################################################
#
# fheroes2
#
################################################################################
# Version: Commits on Oct 26, 2023
FHEROES2_VERSION = e140627b9c6b9349fdc8a4c5dd1418095c15127d
FHEROES2_SITE = $(call github,ihhub,fheroes2,$(FHEROES2_VERSION))
FHEROES2_DEPENDENCIES = sdl2 sdl2_image

$(eval $(cmake-package))
